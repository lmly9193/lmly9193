window.top == window &&
  window.console &&
  (setTimeout(
    console.log.bind(
      console,
      "%c%s",
      "color: red; background: yellow; font-size: 24px;",
      "\u8b66\u544a\uff01"
    )
  ),
  setTimeout(
    console.log.bind(
      console,
      "%c%s",
      "font-size: 18px;",
      "\u4f7f\u7528\u6b64\u63a7\u5236\u53f0\u53ef\u80fd\u6703\u8b93\u653b\u64ca\u8005\u6709\u6a5f\u6703\u5229\u7528\u540d\u70ba Self-XSS \u7684\u653b\u64ca\u65b9\u5f0f\u5192\u7528\u60a8\u7684\u8eab\u5206\uff0c\u7136\u5f8c\u7aca\u53d6\u60a8\u7684\u8cc7\u8a0a\u3002\n\u8acb\u52ff\u8f38\u5165\u6216\u8cbc\u4e0a\u4f86\u6b77\u4e0d\u660e\u7684\u7a0b\u5f0f\u78bc\u3002"
    )
  ));
