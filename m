Return-Path: <linux-fbdev+bounces-262-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AF27FDD84
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Nov 2023 17:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 102FE1C208DC
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Nov 2023 16:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB78374DC;
	Wed, 29 Nov 2023 16:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=asem.it header.i=@asem.it header.b="lUhdcPoX"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2045.outbound.protection.outlook.com [40.107.104.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCDD2A8;
	Wed, 29 Nov 2023 08:45:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnko3q5c596H65DwDrDfbOUMPRY70KX1LU6SvFTQ6PEEV0mlpOJ7AAtb1muGhKBt86ZhU83gbY8Yu9b4Xmy1sSHSWgWFDoxgN1Zi8FDphWgf2XFrxtOO/+IJo93qQZs6R2c9CsVJ2aqv4NOp7tjPHxg+hkdtueyubvRXzUd5z58fG8p0YTF4ogmes14xbEcCvtVj21cZMf3mTIlGljsHVVtzO74EByZZvqHDEMOkWWJBzpYW4oHE3L473G2HoUrMpo7MY8TmflX+0+wU2aG7J3CrTgAu/jyvKHWTf6CBg+T64rWN+VP7DsKeidt/QLlx7FZritN/ANJk+e6w02GLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YmLrSXgTAY2ITY2nCiIcc4kvwsLALJ+OU3ok6sin4o=;
 b=UPjNVLHaLYvEwDR2VLqTXngk282B5PtCfUqnrzQbpu3q414yL4io8peWTb9KFec07saxJmmFDqVVhjFZyL72LWs7QB9Pg8pfL5tf1fGZk0NUst7EF5ctXAQahz4QJeTHbVb/MaIy0LQ7ecnKAnYhNGcIh0mveFDs9OUPG7aBqoQ38u9ft8g+NXky3P0aNz0IB4BNUyAXRwhiMlNHAxMoQNbRtxjBQdyp0L7sr6m8jlOvWhRqV5CsYOwMGIyxdAxc1Eh9gENOLlSxUMjzcues1f5gC4C9KGNAs0+wNsKpC7LZlPOPbG224OJuefvZdXVDAvH02ZbzwmXv7EBh0fCFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=asem.it;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=asem.it;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YmLrSXgTAY2ITY2nCiIcc4kvwsLALJ+OU3ok6sin4o=;
 b=lUhdcPoXBEo6LXY77SyYSRZOWExDQamltgauWECigC4USmMjOS9lqi+RJdVU1H1hIIprQddooEpE/6Xzz+8QLjGmkPhEfQA1QzomuuwUyQP0nhoIvqftlK+ZMHLoytnJqzzDCLyr7LadXIG8hXmzQwDEkc0vwJ0cALdvncuG0X0=
Received: from DU7PR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::16) by AS1PR01MB9081.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4db::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 16:45:16 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::85) by DU7PR01CA0035.outlook.office365.com
 (2603:10a6:10:50e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Wed, 29 Nov 2023 16:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 16:45:16 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Wed, 29 Nov 2023 17:45:15 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v2] backlight: mp3309c: fix uninitialized local variable
Date: Wed, 29 Nov 2023 17:45:14 +0100
Message-Id: <20231129164514.2772719-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Nov 2023 16:45:15.0521 (UTC) FILETIME=[6DC21F10:01DA22E3]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AS1PR01MB9081:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6fd5eab3-ae8a-4bcf-ac52-08dbf0fa90cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m+Ckb/XgIjd9N802NSWyIsyrFdJD6YYFgimzhA+7rWKn6e9cwH1j8bSyDe07Y8fS2HWXt8PyhOTOytD/6YL9O46STFTxzen0Q5wQp9COeV8p9nyqo0Pt4a+XkZPKIWI1Jau0jc8J0RqKxBNriR0JM59H7ZtFKM4moSsQrxQqmtaVCptXl0epc1QF1/bfPtNSAvOJeYOX82P7nWJTF1f4xZOI90hU9f50MjGVkiOAODD+uosLTXT9xiGO0Irbv6nLdD5q7tzlTt1UvY9Cx7uko3YGnpc5xurjmFqFhb2ASWxUIXlJTdyAdD0k1apl86y98Kv1yQDcGTZhp4nR4ZOcKYineiJgUVgAv/AJ1kzQ3uGp6jImFkPy/615nYctaGRsfj0SyW11FKJvU26gyv40btRLgrcNaKiYrBwMhxTSH9YMYMNbLQ+U5MFuHqFJ/XIRKOjLor79Z1kjkYT8KgFbt//msBT9nS4J9T/6BVvWymbeFhX5byaZ9g3pD4wqz9Qpy5uPoz7qY9dfiK7k7zyF0aM1x/IDYYsg49+YUK8YKEVOZM5IwQxGh6DttxhUr0QXNVqfKmckyBbUo75cHD5wzc0CDiY3Lhw4iSacdrlWdGOshOEdZxpQpCJbDJZDEZA0ekW+dHTHTcf0STbdK/6zb2wgthTY3OyPANDeVbXVQPvPlftElLxme2tWhnMYMts0npl8f8Y3TeKCdRzfF9ME/0+2VklyVUcX3bc329sGZmqoSvB66MPaIAZ2x5a+a6MIxCmYl7q6eHx3daf/j4aVfA==
X-Forefront-Antispam-Report:
	CIP:151.1.184.193;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:asas054.asem.intra;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39850400004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(36840700001)(46966006)(36860700001)(36756003)(356005)(82740400003)(81166007)(86362001)(966005)(478600001)(8676002)(4326008)(5660300002)(41300700001)(8936002)(70206006)(110136005)(316002)(70586007)(450100002)(2906002)(47076005)(40480700001)(107886003)(2616005)(336012)(1076003)(26005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:45:16.2601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd5eab3-ae8a-4bcf-ac52-08dbf0fa90cd
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2;Ip=[151.1.184.193];Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9081

In the function "pm3309c_parse_dt_node", when the dimming analog control
mode (by I2C messages) is enabled, the local variable "prop_levels" is
tested without any initialization, as indicated by the following smatch
warning:

drivers/video/backlight/mp3309c.c:279 pm3309c_parse_dt_node() error: uninitialized symbol 'prop_levels'.

To avoid any problem in case of undefined behavior, we need to initialize
it to "NULL".

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/af0a1870-693b-442f-9b11-0503cfcd944a@moroto.mountain/
Fixes: 2e914516a58c ("backlight: mp3309c: Add support for MPS MP3309C")
Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---

v2:
 - remove redundant initialization of "prop_pwms" variable
 - remove "thanks to Dan Carpenter for the report"
 - add "Reported-by: Dan Carpenter <dan.carpenter@linaro.org>" tag
 - add "Closes:" tag

 drivers/video/backlight/mp3309c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 3fe4469ef43f..34d71259fac1 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -203,7 +203,8 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 				 struct mp3309c_platform_data *pdata)
 {
 	struct device_node *node = chip->dev->of_node;
-	struct property *prop_pwms, *prop_levels;
+	struct property *prop_pwms;
+	struct property *prop_levels = NULL;
 	int length = 0;
 	int ret, i;
 	unsigned int num_levels, tmp_value;
-- 
2.34.1


