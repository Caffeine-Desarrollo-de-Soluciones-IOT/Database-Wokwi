/*
  Warnings:

  - A unique constraint covering the columns `[macAddress]` on the table `Sensor` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `macAddress` to the `Sensor` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Sensor" ADD COLUMN     "macAddress" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Sensor_macAddress_key" ON "Sensor"("macAddress");
