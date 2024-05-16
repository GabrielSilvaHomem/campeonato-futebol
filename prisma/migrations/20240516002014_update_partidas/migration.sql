/*
  Warnings:

  - You are about to drop the `partida` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `partida` DROP FOREIGN KEY `partida_timeCasa_id_fkey`;

-- DropForeignKey
ALTER TABLE `partida` DROP FOREIGN KEY `partida_timeVisitante_id_fkey`;

-- DropTable
DROP TABLE `partida`;

-- CreateTable
CREATE TABLE `partidas` (
    `id` VARCHAR(191) NOT NULL,
    `data` DATETIME(3) NOT NULL,
    `local` VARCHAR(191) NOT NULL,
    `placar` VARCHAR(191) NOT NULL,
    `timeCasa_id` VARCHAR(191) NOT NULL,
    `timeVisitante_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `partidas` ADD CONSTRAINT `partidas_timeCasa_id_fkey` FOREIGN KEY (`timeCasa_id`) REFERENCES `times`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partidas` ADD CONSTRAINT `partidas_timeVisitante_id_fkey` FOREIGN KEY (`timeVisitante_id`) REFERENCES `times`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
