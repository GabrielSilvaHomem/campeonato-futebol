/*
  Warnings:

  - You are about to drop the `jogador_time` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `jogador_time` DROP FOREIGN KEY `jogador_time_fk_id_jogador_fkey`;

-- DropForeignKey
ALTER TABLE `jogador_time` DROP FOREIGN KEY `jogador_time_fk_id_time_fkey`;

-- DropTable
DROP TABLE `jogador_time`;

-- CreateTable
CREATE TABLE `jogadores_times` (
    `id` VARCHAR(191) NOT NULL,
    `fk_id_times` VARCHAR(191) NOT NULL,
    `fk_id_jogadores` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `jogadores_times` ADD CONSTRAINT `jogadores_times_fk_id_times_fkey` FOREIGN KEY (`fk_id_times`) REFERENCES `times`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `jogadores_times` ADD CONSTRAINT `jogadores_times_fk_id_jogadores_fkey` FOREIGN KEY (`fk_id_jogadores`) REFERENCES `jogadores`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
