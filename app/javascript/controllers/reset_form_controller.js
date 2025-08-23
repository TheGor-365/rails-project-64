import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  reset(event) {
    const detail = event.detail || {};
    let status = null;

    try {
      status = detail.fetchResponse?.response?.status ?? detail.fetchResponse?.statusCode ?? null;
    } catch (_) {
      status = null;
    }

    const ok = status ? (status >= 200 && status < 400) : !!detail.success;
    if (!ok) return;

    // 1) очистить поля
    if (typeof this.element.reset === "function") this.element.reset();

    // 2) закрыть коллапс (fallback, если стрим не успеет)
    const collapseEl = this.element.closest(".collapse");
    if (collapseEl) {
      collapseEl.classList.remove("show");
      collapseEl.setAttribute("aria-expanded", "false");
      const id = collapseEl.id && `#${collapseEl.id}`;
      if (id) {
        const btn = document.querySelector(`[data-bs-target="${id}"], a[href="${id}"]`);
        if (btn) btn.setAttribute("aria-expanded", "false");
      }
    }
  }
}
