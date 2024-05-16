/*
  Warnings:

  - You are about to drop the `jogador` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `time` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `jogador_time` DROP FOREIGN KEY `jogador_time_fk_id_jogador_fkey`;

-- DropForeignKey
ALTER TABLE `jogador_time` DROP FOREIGN KEY `jogador_time_fk_id_time_fkey`;

-- DropForeignKey
ALTER TABLE `partida` DROP FOREIGN KEY `partida_timeCasa_id_fkey`;

-- DropForeignKey
ALTER TABLE `partida` DROP FOREIGN KEY `partida_timeVisitante_id_fkey`;

-- DropTable
DROP TABLE `jogador`;

-- DropTable
DROP TABLE `time`;

-- CreateTable
CREATE TABLE `jogadores` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `idade` INTEGER NOT NULL,
    `posicao` VARCHAR(191) NOT NULL,
    `nacionalidade` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `times` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `ano` DATETIME(3) NOT NULL,
    `pais` VARCHAR(191) NOT NULL,
    `tecnico` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `partida` ADD CONSTRAINT `partida_timeCasa_id_fkey` FOREIGN KEY (`timeCasa_id`) REFERENCES `times`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partida` ADD CONSTRAINT `partida_timeVisitante_id_fkey` FOREIGN KEY (`timeVisitante_id`) REFERENCES `times`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `jogador_time` ADD CONSTRAINT `jogador_time_fk_id_time_fkey` FOREIGN KEY (`fk_id_time`) REFERENCES `times`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `jogador_time` ADD CONSTRAINT `jogador_time_fk_id_jogador_fkey` FOREIGN KEY (`fk_id_jogador`) REFERENCES `jogadores`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
