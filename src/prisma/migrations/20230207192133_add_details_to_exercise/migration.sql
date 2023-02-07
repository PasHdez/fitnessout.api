/*
  Warnings:

  - Added the required column `description` to the `Exercise` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gifUrl` to the `Exercise` table without a default value. This is not possible if the table is not empty.
  - Added the required column `videoUrl` to the `Exercise` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "ExerciseBodyPart" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ExerciseToExerciseBodyPart" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_ExerciseToExerciseBodyPart_A_fkey" FOREIGN KEY ("A") REFERENCES "Exercise" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_ExerciseToExerciseBodyPart_B_fkey" FOREIGN KEY ("B") REFERENCES "ExerciseBodyPart" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Exercise" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "gifUrl" TEXT NOT NULL,
    "videoUrl" TEXT NOT NULL
);
INSERT INTO "new_Exercise" ("id", "name") SELECT "id", "name" FROM "Exercise";
DROP TABLE "Exercise";
ALTER TABLE "new_Exercise" RENAME TO "Exercise";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "_ExerciseToExerciseBodyPart_AB_unique" ON "_ExerciseToExerciseBodyPart"("A", "B");

-- CreateIndex
CREATE INDEX "_ExerciseToExerciseBodyPart_B_index" ON "_ExerciseToExerciseBodyPart"("B");
