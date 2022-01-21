import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/utils/index.dart';
import 'package:zkfly/zkfly.dart';

class CommandKey extends StatefulWidget {
  const CommandKey({Key? key, this.filter}) : super(key: key);
  final ZkFilter? filter;
  @override
  State<CommandKey> createState() => _CommandKeyState();
}

class _CommandKeyState extends State<CommandKey> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  bool enableSave = false;
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        enableSave = _controller.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(children: [
        Form(
            key: _formKey,
            child: TextFormField(
              validator: validateCommand,
              controller: _controller,
              autofocus: true,
              decoration: const InputDecoration(
                  hintText: 'CommandKey', border: InputBorder.none),
            )),
        // footer
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            elevatedButton(
                widget.filter?.labelTextOf(FlybeeKey.beeKeyBtnCancel) ?? '',
                () => widget.filter?.onPressed(FlybeeKey.beeKeyBtnCancel)),
            elevatedButton(
              widget.filter?.labelTextOf(FlybeeKey.beeKeyBtnConfirm) ?? '',
              enableSave
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        widget.filter!
                            .actionOf(FlybeeKey.beeKeyBtnConfirm)
                            .onPressedCallback!
                            .call(_controller.text);
                      }
                    }
                  : null,
            ),
          ],
        )
      ]),
    );
  }

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
}
