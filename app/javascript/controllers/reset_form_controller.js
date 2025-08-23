import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  reset(event) {
    const detail = event.detail || {};
    const resp = detail.fetchResponse;
    const status = resp && ("statusCode" in resp ? resp.statusCode : resp.response?.status);

    // Считаем успешным 2xx и 3xx (редиректы тоже ок)
    const isSuccess = status ? (status >= 200 && status < 400) : !!detail.success;

    if (isSuccess) {
      // очистить поля формы
      if (typeof this.element.reset === "function") this.element.reset();

      // закрыть коллапс у reply (если форма внутри .collapse)
      const collapseEl = this.element.closest(".collapse");
      if (collapseEl && typeof bootstrap !== "undefined") {
        const inst = bootstrap.Collapse.getOrCreateInstance(collapseEl);
        inst.hide();
      }
    }
  }
}
