import { Application } from "@hotwired/stimulus";

import ResetFormController from "./reset_form_controller";
import FlashController from "./flash_controller";

window.Stimulus = Application.start();
Stimulus.register("reset-form", ResetFormController);
Stimulus.register("flash", FlashController);
