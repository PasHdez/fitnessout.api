import { Router } from "express";
import ExerciseController from "@controllers/exercise.controller";
import { Routes } from "@interfaces/routes.interface";

class ExerciseRoute implements Routes {
  public path = "/exercise";
  public router = Router();
  public exerciseController = new ExerciseController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(
      `${this.path}/:id`,
      this.exerciseController.getExerciseById
    );
  }
}

export default ExerciseRoute;
