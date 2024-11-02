-- CreateTable
CREATE TABLE "Sensor" (
    "id" SERIAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "lecturaActual" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Sensor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LecturaSensor" (
    "id" SERIAL NOT NULL,
    "sensorId" INTEGER NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "unidad" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LecturaSensor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Actuador" (
    "id" SERIAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "estado" TEXT NOT NULL,

    CONSTRAINT "Actuador_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ComandoActuador" (
    "id" SERIAL NOT NULL,
    "actuadorId" INTEGER NOT NULL,
    "tipoComando" TEXT NOT NULL,
    "parametro" TEXT,

    CONSTRAINT "ComandoActuador_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "LecturaSensor" ADD CONSTRAINT "LecturaSensor_sensorId_fkey" FOREIGN KEY ("sensorId") REFERENCES "Sensor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComandoActuador" ADD CONSTRAINT "ComandoActuador_actuadorId_fkey" FOREIGN KEY ("actuadorId") REFERENCES "Actuador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
