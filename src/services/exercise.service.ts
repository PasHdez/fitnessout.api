import { Exercise } from "@prisma/client";
import { prismaClient } from "@/prisma";

class ExerciseService {
  public exercises = prismaClient.exercise;
  async getExerciseById(id: number): Promise<Exercise> {
    const exercise = await this.exercises.findUnique({
      where: {
        id: id,
      },
    });
    return exercise;
  }
}

export default ExerciseService;
