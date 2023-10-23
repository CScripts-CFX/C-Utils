let CLIPBOARD;
let SET_CLIPBOARD;

function SetClipboard() {
  if (CLIPBOARD) {
    let elem = document.createElement("textarea");
    let success = false;

    if (typeof CLIPBOARD.payload !== "string")
      CLIPBOARD.payload = JSON.stringify(CLIPBOARD.payload, null, 4);

    elem.value = CLIPBOARD.payload;
    document.body.appendChild(elem);

    elem.focus();
    elem.select();

    try {
      success = !!document.execCommand("copy");
    } catch (err) {}

    document.body.removeChild(elem);

    if (window.parent !== window)
      fetch("http://wrp_utils/message", {
        method: "POST",
        body: JSON.stringify({
          type: "SET_CLIPBOARD",
          payload: success,
        }),
      });

    CLIPBOARD = null;
  }
}

const ACTION_SETTING_CLIPBOARD = {
  method: "POST",
  body: JSON.stringify({
    type: "SETTING_CLIPBOARD",
    payload: true,
  }),
};

function onMessage(evt) {
  if (!CLIPBOARD) {
    if (evt.data && evt.data.type == "SET_CLIPBOARD") {
      CLIPBOARD = evt.data;
      fetch("http://wrp_utils/message", ACTION_SETTING_CLIPBOARD);
      SetClipboard();  // Set clipboard directly after receiving the SET_CLIPBOARD message
    }
  }
}

window.addEventListener("message", onMessage);