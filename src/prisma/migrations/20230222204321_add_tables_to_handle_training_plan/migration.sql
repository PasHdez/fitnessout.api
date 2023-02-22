/*
  Warnings:

  - You are about to drop the `TrainingExercise` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserTraining` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `dob` to the `Profile` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gender` to the `Profile` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "TrainingExercise" DROP CONSTRAINT "TrainingExercise_exerciseId_fkey";

-- DropForeignKey
ALTER TABLE "TrainingExercise" DROP CONSTRAINT "TrainingExercise_trainingId_fkey";

-- DropForeignKey
ALTER TABLE "UserTraining" DROP CONSTRAINT "UserTraining_trainingId_fkey";

-- DropForeignKey
ALTER TABLE "UserTraining" DROP CONSTRAINT "UserTraining_userId_fkey";

-- AlterTable
ALTER TABLE "Profile" ADD COLUMN     "dob" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "gender" TEXT NOT NULL;

-- DropTable
DROP TABLE "TrainingExercise";

-- DropTable
DROP TABLE "UserTraining";

-- CreateTable
CREATE TABLE "UserTrainingPlan" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "trainingPlanId" INTEGER NOT NULL,

    CONSTRAINT "UserTrainingPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingPlan" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "durationDays" INTEGER NOT NULL,

    CONSTRAINT "TrainingPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingDay" (
    "id" SERIAL NOT NULL,
    "day" INTEGER NOT NULL,
    "dayName" TEXT NOT NULL,
    "trainingPlanId" INTEGER NOT NULL,
    "trainingId" INTEGER,

    CONSTRAINT "TrainingDay_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExerciseTraining" (
    "id" SERIAL NOT NULL,
    "reps" INTEGER NOT NULL,
    "repsDuration" INTEGER NOT NULL,
    "rest" INTEGER NOT NULL,
    "restDuration" INTEGER NOT NULL,
    "sets" INTEGER NOT NULL,
    "restBetweenSets" INTEGER NOT NULL,
    "trainingId" INTEGER NOT NULL,
    "exerciseId" INTEGER NOT NULL,

    CONSTRAINT "ExerciseTraining_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "UserTrainingPlan" ADD CONSTRAINT "UserTrainingPlan_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTrainingPlan" ADD CONSTRAINT "UserTrainingPlan_trainingPlanId_fkey" FOREIGN KEY ("trainingPlanId") REFERENCES "TrainingPlan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingDay" ADD CONSTRAINT "TrainingDay_trainingPlanId_fkey" FOREIGN KEY ("trainingPlanId") REFERENCES "TrainingPlan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingDay" ADD CONSTRAINT "TrainingDay_trainingId_fkey" FOREIGN KEY ("trainingId") REFERENCES "Training"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseTraining" ADD CONSTRAINT "ExerciseTraining_trainingId_fkey" FOREIGN KEY ("trainingId") REFERENCES "Training"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseTraining" ADD CONSTRAINT "ExerciseTraining_exerciseId_fkey" FOREIGN KEY ("exerciseId") REFERENCES "Exercise"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
