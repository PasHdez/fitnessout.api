/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `MuscleGroup` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `reps` to the `TrainingExercise` table without a default value. This is not possible if the table is not empty.
  - Added the required column `repsDuration` to the `TrainingExercise` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rest` to the `TrainingExercise` table without a default value. This is not possible if the table is not empty.
  - Added the required column `restBetweenSets` to the `TrainingExercise` table without a default value. This is not possible if the table is not empty.
  - Added the required column `restDuration` to the `TrainingExercise` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sets` to the `TrainingExercise` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_TrainingExercise" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "reps" INTEGER NOT NULL,
    "repsDuration" INTEGER NOT NULL,
    "rest" INTEGER NOT NULL,
    "restDuration" INTEGER NOT NULL,
    "sets" INTEGER NOT NULL,
    "restBetweenSets" INTEGER NOT NULL,
    "trainingId" INTEGER NOT NULL,
    "exerciseId" INTEGER NOT NULL,
    CONSTRAINT "TrainingExercise_trainingId_fkey" FOREIGN KEY ("trainingId") REFERENCES "Training" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "TrainingExercise_exerciseId_fkey" FOREIGN KEY ("exerciseId") REFERENCES "Exercise" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_TrainingExercise" ("exerciseId", "id", "trainingId") SELECT "exerciseId", "id", "trainingId" FROM "TrainingExercise";
DROP TABLE "TrainingExercise";
ALTER TABLE "new_TrainingExercise" RENAME TO "TrainingExercise";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "MuscleGroup_name_key" ON "MuscleGroup"("name");
