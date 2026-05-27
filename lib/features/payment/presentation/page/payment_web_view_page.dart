
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/widgets/button/adaptive_dialog_button.dart';
import 'package:esim_mob_app/common/widgets/dialog/alert_adaptive_dialog.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:esim_mob_app/features/status_transaction/domain/use_cases/save_last_transaction_id_use_case.dart';
import 'package:esim_mob_app/features/status_transaction/presentation/bloc/status_transaction_bloc.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewPage extends StatefulWidget {
  const PaymentWebViewPage({super.key, required this.url, required this.trx});

  final String url;
  final String trx;

  @override
  State<PaymentWebViewPage> createState() => _PaymentWebViewPageState();
}

class _PaymentWebViewPageState extends State<PaymentWebViewPage> {

  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    final NavigationDelegate navigationDelegate = NavigationDelegate(
        onUrlChange: (url)  {
          if (!mounted) return;
          if (url.url == null) return;

          if(url.url != null && url.url!.contains(widget.trx)){
            FocusManager.instance.primaryFocus?.unfocus();
            Future.delayed(const Duration(milliseconds: 100), () async{
              if (!mounted) return;

              showAdaptiveDialog(
                context: context,
                builder: (_) {
                  return PaymentDialog(
                    isSuccess: url.url!.contains(widget.trx), trx: widget.trx,
                  );
                },
              );

              // context.read<AuthentificationBloc>().add(const AuthentificationEvent.getSignedInUser());
              // await injector<SaveLastTransactionIdUseCase>().call(widget.trx);
              // context.read<StatusTransactionBloc>().add(const StatusTransactionEvent.fetchLastTransactionStatus());
              // // List<UserESimModel> userTariffs = context.read<AuthentificationBloc>().state.user.userESims;
              // context.read<HistoryBloc>().add(const HistoryEvent.fetchHistory(page: 1));
              // context.pop();
              //
              // context.go(Routes.home);
            });
          }
        }
    );
    _webViewController = WebViewController()..loadRequest(Uri.parse(widget.url))..setJavaScriptMode(JavaScriptMode.unrestricted)..setNavigationDelegate(navigationDelegate);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBar(
        title: const DefaultText.bodySmall('Payment'),
      ),
      body: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          bottom: false,
          left: false,
          right: false,
          child: WebViewWidget(
            controller: _webViewController,
          ),
        ),
      ),
    );
  }
}

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({
    super.key,
    required this.isSuccess,
    required this.trx,
  });

  final bool isSuccess;
  final String trx;

  String get _title => isSuccess ? 'Success' : 'Error';

  String get _content => isSuccess ? 'Payment successful' : 'Payment failed';

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: _title,
      content: _content,
      actions: [
        BlocBuilder<AuthentificationBloc, AuthentificationState>(
          builder: (context, state) {
            return AdaptiveDialogButton(
              title: 'OK',
              isLoading: state.maybeMap(orElse: () => false, loading: (_) => true),
              onPressed: () async {
                context.read<AuthentificationBloc>().add(const AuthentificationEvent.getSignedInUser());
                await injector<SaveLastTransactionIdUseCase>().call(trx);
                context.read<StatusTransactionBloc>().add(const StatusTransactionEvent.fetchLastTransactionStatus());
                // List<UserESimModel> userTariffs = context.read<AuthentificationBloc>().state.user.userESims;
                context.read<HistoryBloc>().add(const HistoryEvent.fetchHistory(page: 1));
                context.pop();

                context.go(Routes.home);
              },
            );
          },
        ),
      ],
    );
  }
}
