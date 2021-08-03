-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'SELLER');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT E'USER',

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Seller" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Item" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "price" INTEGER NOT NULL,
    "sellerId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User.email_unique" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Item.sellerId_unique" ON "Item"("sellerId");

-- AddForeignKey
ALTER TABLE "Item" ADD FOREIGN KEY ("sellerId") REFERENCES "Seller"("id") ON DELETE CASCADE ON UPDATE CASCADE;
