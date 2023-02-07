import App from "@/app";
import validateEnv from "@utils/validateEnv";
import IndexRoute from "@routes/index.route";
import ExerciseRoute from "./routes/exercise.route";

validateEnv();

const app = new App([new IndexRoute(), new ExerciseRoute()]);

app.listen();
