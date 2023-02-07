import { ExerciseCategory } from "@prisma/client";
import { prismaClient } from "@/prisma";

class ExerciseCategoryService {
  public exerciseCategories = prismaClient.exerciseCategory;

  async addCategories(categories: string[]): Promise<ExerciseCategory[]> {
    const findCategories = await this.exerciseCategories.findMany({
      where: {
        name: {
          in: categories,
        },
      },
    });
    const newCategories = categories.filter(
      (category) => !findCategories.map((c) => c.name).includes(category)
    );

    const promises = newCategories.map((category) =>
      this.exerciseCategories.create({
        data: {
          name: category,
        },
      })
    );
    const createdCategories = await Promise.all(promises);
    return [...findCategories, ...createdCategories];
  }
}

export default ExerciseCategoryService;
