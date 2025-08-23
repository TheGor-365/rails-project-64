import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { message: String }

  notice() {
    const msg = this.messageValue || "Сообщение";
    // Небольшой самодостаточный "флеш" без завязки на layout
    const wrap = document.createElement("div");
    wrap.setAttribute("role", "alert");
    wrap.style.position = "fixed";
    wrap.style.top = "16px";
    wrap.style.right = "16px";
    wrap.style.zIndex = "1080";
    wrap.style.maxWidth = "420px";

    const alert = document.createElement("div");
    alert.className = "alert alert-info shadow";
    alert.textContent = msg;

    wrap.appendChild(alert);
    document.body.appendChild(wrap);

    // автозакрытие через 3с
    setTimeout(() => {
      wrap.remove();
    }, 3000);
  }
}
