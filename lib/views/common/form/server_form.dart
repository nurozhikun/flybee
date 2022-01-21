import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/utils/index.dart';
import 'package:zkfly/app/index.dart';

class ServerForm extends StatefulWidget {
  const ServerForm({Key? key, this.filter, this.autofocus = true})
      : super(key: key);
  final ZkFilter? filter;
  final bool autofocus;

  @override
  _ServerFormState createState() => _ServerFormState();
}

class _ServerFormState extends State<ServerForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _ipCtrl = TextEditingController();
  final _portCtrl = TextEditingController();
  bool _enableTest = false;
  bool _enableSave = false;

  @override
  void initState() {
    _ipCtrl.addListener(() {
      setState(() {
        _enableTest = (_ipCtrl.text.isNotEmpty && _portCtrl.text.isNotEmpty);
        _enableSave = false;
      });
    });
    _portCtrl.addListener(() {
      setState(() {
        _enableTest = (_ipCtrl.text.isNotEmpty && _portCtrl.text.isNotEmpty);
        _enableSave = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _ipCtrl.dispose();
    _portCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        // 封装children 避免嵌套过多
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: TextFormField(
          validator: validateServerIp,
          autofocus: widget.autofocus,
          controller: _ipCtrl,
          decoration: const InputDecoration(
            labelText: "Ip",
            hintText: "ip",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: TextFormField(
          validator: validateServerPort,
          autofocus: false,
          controller: _portCtrl,
          decoration: const InputDecoration(
            labelText: "Port",
            hintText: "port",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            elevatedButton(
                widget.filter?.labelTextOf(FlybeeKey.beeKeyTest) ?? 'btn',
                _enableTest
                    ? () async {
                        if (_formKey.currentState!.validate()) {
                          var res = await widget.filter
                              ?.actionOf(FlybeeKey.beeKeyTest)
                              .onPressedCallback
                              ?.call(_ipCtrl.text, _portCtrl.text, widget.key,
                                  widget.filter);
                          print(res);
                          setState(() {
                            _enableSave = true;
                          });
                        }
                      }
                    : null),
            elevatedButton(
                widget.filter?.labelTextOf(FlybeeKey.beeKeySave) ?? 'btn',
                _enableSave
                    ? () => widget.filter
                        ?.actionOf(FlybeeKey.beeKeySave)
                        .onPressedCallback
                        ?.call(_ipCtrl.text, _portCtrl.text, widget.key,
                            widget.filter)
                    : null),
          ],
        ),
      ),
    ];
  }
}

// await widget.filter?.login(_nameCtrl.text, _pwdCtrl.text);
ElevatedButton elevatedButton(String title, _onPress) {
  return ElevatedButton(
    onPressed: _onPress,
    child: Text(
      title,
      style: const TextStyle(fontSize: 12),
    ),
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(60, 32)),
    ),
  );
}
