ALTER TABLE  `presignups` ADD  `type` ENUM(  'publisher',  'advertiser' ) NOT NULL DEFAULT  'publisher' AFTER  `referral_url`;
