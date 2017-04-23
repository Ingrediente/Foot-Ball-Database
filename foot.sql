CREATE TABLE "manager" (
  "manager_id" SERIAL PRIMARY KEY,
  "fname" TEXT NOT NULL,
  "mname" TEXT NOT NULL,
  "lname" TEXT NOT NULL,
  "country" TEXT NOT NULL,
  "age" INTEGER NOT NULL,
  "salary" INTEGER NOT NULL,
  "current_term" TEXT NOT NULL
);

CREATE TABLE "points_table" (
  "year" SERIAL PRIMARY KEY
);

CREATE TABLE "sponser" (
  "sponser_id" SERIAL PRIMARY KEY,
  "s_name" TEXT NOT NULL
);

CREATE TABLE "team" (
  "team_name" TEXT PRIMARY KEY,
  "year_estd" DATE NOT NULL,
  "no_of_trophies" INTEGER NOT NULL,
  "manager_id" INTEGER NOT NULL,
  "position" INTEGER NOT NULL
);

CREATE INDEX "idx_team__manager_id" ON "team" ("manager_id");

CREATE INDEX "idx_team__position" ON "team" ("position");

ALTER TABLE "team" ADD CONSTRAINT "fk_team__manager_id" FOREIGN KEY ("manager_id") REFERENCES "manager" ("manager_id");

ALTER TABLE "team" ADD CONSTRAINT "fk_team__position" FOREIGN KEY ("position") REFERENCES "points_table" ("year");

CREATE TABLE "owner" (
  "owner_id" SERIAL PRIMARY KEY,
  "owner_fname" TEXT NOT NULL,
  "owner_mname" TEXT NOT NULL,
  "owner_lname" TEXT NOT NULL,
  "team_name" TEXT NOT NULL
);

CREATE INDEX "idx_owner__team_name" ON "owner" ("team_name");

ALTER TABLE "owner" ADD CONSTRAINT "fk_owner__team_name" FOREIGN KEY ("team_name") REFERENCES "team" ("team_name");

CREATE TABLE "player" (
  "player_id" SERIAL PRIMARY KEY,
  "fname" TEXT NOT NULL,
  "mname" TEXT NOT NULL,
  "lname" TEXT NOT NULL,
  "age" INTEGER NOT NULL,
  "country" TEXT NOT NULL,
  "salary" INTEGER NOT NULL,
  "position" INTEGER NOT NULL,
  "team_name" TEXT NOT NULL
);

CREATE INDEX "idx_player__team_name" ON "player" ("team_name");

ALTER TABLE "player" ADD CONSTRAINT "fk_player__team_name" FOREIGN KEY ("team_name") REFERENCES "team" ("team_name");

CREATE TABLE "player_sponser" (
  "player" INTEGER NOT NULL,
  "sponser" INTEGER NOT NULL,
  PRIMARY KEY ("player", "sponser")
);

CREATE INDEX "idx_player_sponser" ON "player_sponser" ("sponser");

ALTER TABLE "player_sponser" ADD CONSTRAINT "fk_player_sponser__player" FOREIGN KEY ("player") REFERENCES "player" ("player_id");

ALTER TABLE "player_sponser" ADD CONSTRAINT "fk_player_sponser__sponser" FOREIGN KEY ("sponser") REFERENCES "sponser" ("sponser_id");

CREATE TABLE "sponser_team" (
  "sponser" INTEGER NOT NULL,
  "team" TEXT NOT NULL,
  PRIMARY KEY ("sponser", "team")
);

CREATE INDEX "idx_sponser_team" ON "sponser_team" ("team");

ALTER TABLE "sponser_team" ADD CONSTRAINT "fk_sponser_team__sponser" FOREIGN KEY ("sponser") REFERENCES "sponser" ("sponser_id");

ALTER TABLE "sponser_team" ADD CONSTRAINT "fk_sponser_team__team" FOREIGN KEY ("team") REFERENCES "team" ("team_name");

CREATE TABLE "stadium" (
  "stadium_name" SERIAL PRIMARY KEY,
  "capacity" INTEGER NOT NULL,
  "location" TEXT NOT NULL,
  "year_estd" DATE NOT NULL,
  "team_name" TEXT NOT NULL
);

CREATE INDEX "idx_stadium__team_name" ON "stadium" ("team_name");

ALTER TABLE "stadium" ADD CONSTRAINT "fk_stadium__team_name" FOREIGN KEY ("team_name") REFERENCES "team" ("team_name");

CREATE TABLE "match" (
  "match_id" SERIAL PRIMARY KEY,
  "date" DATE NOT NULL,
  "stadium_name" INTEGER NOT NULL
);

CREATE INDEX "idx_match__stadium_name" ON "match" ("stadium_name");

ALTER TABLE "match" ADD CONSTRAINT "fk_match__stadium_name" FOREIGN KEY ("stadium_name") REFERENCES "stadium" ("stadium_name");

CREATE TABLE "match_team" (
  "match" INTEGER NOT NULL,
  "team" TEXT NOT NULL,
  PRIMARY KEY ("match", "team")
);

CREATE INDEX "idx_match_team" ON "match_team" ("team");

ALTER TABLE "match_team" ADD CONSTRAINT "fk_match_team__match" FOREIGN KEY ("match") REFERENCES "match" ("match_id");

ALTER TABLE "match_team" ADD CONSTRAINT "fk_match_team__team" FOREIGN KEY ("team") REFERENCES "team" ("team_name")