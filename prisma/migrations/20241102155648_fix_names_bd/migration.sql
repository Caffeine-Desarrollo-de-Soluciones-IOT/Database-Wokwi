/*
  Warnings:

  - You are about to drop the column `estado` on the `Sensor` table. All the data in the column will be lost.
  - You are about to drop the column `lecturaActual` on the `Sensor` table. All the data in the column will be lost.
  - You are about to drop the column `tipo` on the `Sensor` table. All the data in the column will be lost.
  - You are about to drop the `Actuador` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ComandoActuador` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `LecturaSensor` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `currentReading` to the `Sensor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `status` to the `Sensor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `Sensor` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ComandoActuador" DROP CONSTRAINT "ComandoActuador_actuadorId_fkey";

-- DropForeignKey
ALTER TABLE "LecturaSensor" DROP CONSTRAINT "LecturaSensor_sensorId_fkey";

-- AlterTable
ALTER TABLE "Sensor" DROP COLUMN "estado",
DROP COLUMN "lecturaActual",
DROP COLUMN "tipo",
ADD COLUMN     "currentReading" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "status" TEXT NOT NULL,
ADD COLUMN     "type" TEXT NOT NULL;

-- DropTable
DROP TABLE "Actuador";

-- DropTable
DROP TABLE "ComandoActuador";

-- DropTable
DROP TABLE "LecturaSensor";

-- CreateTable
CREATE TABLE "ReadingSensor" (
    "id" SERIAL NOT NULL,
    "sensorId" INTEGER NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ReadingSensor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Actuator" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Actuator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CommandActuator" (
    "id" SERIAL NOT NULL,
    "actuatorId" INTEGER NOT NULL,
    "typeCommand" TEXT NOT NULL,
    "parameter" TEXT NOT NULL,

    CONSTRAINT "CommandActuator_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ReadingSensor" ADD CONSTRAINT "ReadingSensor_sensorId_fkey" FOREIGN KEY ("sensorId") REFERENCES "Sensor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommandActuator" ADD CONSTRAINT "CommandActuator_actuatorId_fkey" FOREIGN KEY ("actuatorId") REFERENCES "Actuator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
