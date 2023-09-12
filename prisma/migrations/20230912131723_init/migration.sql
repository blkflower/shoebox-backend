/*
  Warnings:

  - You are about to drop the `shoecolor` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `shoecolor`;

-- CreateTable
CREATE TABLE `ShoeOrder` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `orderId` INTEGER NOT NULL,
    `shoeId` INTEGER NOT NULL,
    `colorId` INTEGER NOT NULL,
    `sizeId` INTEGER NOT NULL,
    `quantity` INTEGER NOT NULL,
    `price` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ShoeToSize` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_ShoeToSize_AB_unique`(`A`, `B`),
    INDEX `_ShoeToSize_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ColorToShoe` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_ColorToShoe_AB_unique`(`A`, `B`),
    INDEX `_ColorToShoe_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_CategoryToShoe` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_CategoryToShoe_AB_unique`(`A`, `B`),
    INDEX `_CategoryToShoe_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ShoeOrder` ADD CONSTRAINT `ShoeOrder_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ShoeOrder` ADD CONSTRAINT `ShoeOrder_shoeId_fkey` FOREIGN KEY (`shoeId`) REFERENCES `Shoe`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ShoeOrder` ADD CONSTRAINT `ShoeOrder_colorId_fkey` FOREIGN KEY (`colorId`) REFERENCES `Color`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ShoeOrder` ADD CONSTRAINT `ShoeOrder_sizeId_fkey` FOREIGN KEY (`sizeId`) REFERENCES `Size`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ShoeToSize` ADD CONSTRAINT `_ShoeToSize_A_fkey` FOREIGN KEY (`A`) REFERENCES `Shoe`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ShoeToSize` ADD CONSTRAINT `_ShoeToSize_B_fkey` FOREIGN KEY (`B`) REFERENCES `Size`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ColorToShoe` ADD CONSTRAINT `_ColorToShoe_A_fkey` FOREIGN KEY (`A`) REFERENCES `Color`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ColorToShoe` ADD CONSTRAINT `_ColorToShoe_B_fkey` FOREIGN KEY (`B`) REFERENCES `Shoe`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CategoryToShoe` ADD CONSTRAINT `_CategoryToShoe_A_fkey` FOREIGN KEY (`A`) REFERENCES `Category`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CategoryToShoe` ADD CONSTRAINT `_CategoryToShoe_B_fkey` FOREIGN KEY (`B`) REFERENCES `Shoe`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
