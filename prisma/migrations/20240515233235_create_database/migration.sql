-- CreateTable
CREATE TABLE `jogador` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `idade` INTEGER NOT NULL,
    `posicao` VARCHAR(191) NOT NULL,
    `nacionalidade` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `time` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `ano` DATETIME(3) NOT NULL,
    `pais` VARCHAR(191) NOT NULL,
    `tecnico` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partida` (
    `id` VARCHAR(191) NOT NULL,
    `data` DATETIME(3) NOT NULL,
    `local` VARCHAR(191) NOT NULL,
    `placar` VARCHAR(191) NOT NULL,
    `timeCasa_id` VARCHAR(191) NOT NULL,
    `timeVisitante_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `jogador_time` (
    `id` VARCHAR(191) NOT NULL,
    `fk_id_time` VARCHAR(191) NOT NULL,
    `fk_id_jogador` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `partida` ADD CONSTRAINT `partida_timeCasa_id_fkey` FOREIGN KEY (`timeCasa_id`) REFERENCES `time`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partida` ADD CONSTRAINT `partida_timeVisitante_id_fkey` FOREIGN KEY (`timeVisitante_id`) REFERENCES `time`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `jogador_time` ADD CONSTRAINT `jogador_time_fk_id_time_fkey` FOREIGN KEY (`fk_id_time`) REFERENCES `time`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `jogador_time` ADD CONSTRAINT `jogador_time_fk_id_jogador_fkey` FOREIGN KEY (`fk_id_jogador`) REFERENCES `jogador`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
