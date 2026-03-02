
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/widgets/button/adaptive_dialog_button.dart';
import 'package:esim_mob_app/common/widgets/dialog/alert_adaptive_dialog.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
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
        onUrlChange: (url) {
          if (!mounted) return;
          if (url.url == null) return;

          if(url.url != null && url.url!.contains(widget.trx)){
            FocusManager.instance.primaryFocus?.unfocus();
            Future.delayed(const Duration(milliseconds: 100), () {
              if (!mounted) return;

              showAdaptiveDialog(
                context: context,
                builder: (_) {
                  return PaymentDialog(
                    isSuccess: url.url!.contains(widget.trx),
                  );
                },
              );
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
  });

  final bool isSuccess;

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
              onPressed: () {
                if (isSuccess) {
                  context.read<AuthentificationBloc>().add(const AuthentificationEvent.getSignedInUser());
                }
                List<PackageModel> userTariffs = context.read<AuthentificationBloc>().state.user.userTariffs;
                context.pop();

                context.go(Routes.home, extra: {'user_tariffs': userTariffs});
              },
            );
          },
        ),
      ],
    );
  }
}
