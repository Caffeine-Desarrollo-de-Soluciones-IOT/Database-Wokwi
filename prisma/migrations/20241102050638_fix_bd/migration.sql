/*
  Warnings:

  - Made the column `parametro` on table `ComandoActuador` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "ComandoActuador" ALTER COLUMN "parametro" SET NOT NULL;
