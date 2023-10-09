import { application } from "./application"

import HelloController from "./hello_controller"
import ModalController from "./modal_controller"
import ReadArticleController from "./read_article_controller"

application.register("hello", HelloController)
application.register("modal", ModalController)
application.register("read-article", ReadArticleController)