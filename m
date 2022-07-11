Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06494563B0B
	for <lists+linux-fbdev@lfdr.de>; Fri,  1 Jul 2022 22:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbiGAUYE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 1 Jul 2022 16:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbiGAUYD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 1 Jul 2022 16:24:03 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F393DA62
        for <linux-fbdev@vger.kernel.org>; Fri,  1 Jul 2022 13:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656707034;
        bh=s8CRbVLDl822YwqtLOMoLmiiti7AwrtUoVUWnkJvUC8=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=UYjcTSR4SYnQByYvB0wwwK4cL0h9YEIImBNGlG9AqjSnZTGYMXinX0XoSgcVY4vYz
         JAeVPbs5MLtJssjjwzPTvHN7kYkk35McRfb5b5T+QHz2VxoI44YrWaeYxZhfjR59Xg
         zwK4HIpPbDLdni0//AX8Sj0DVgxmyZ3uVdIjAJOo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.182.192]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTAFb-1oC0w90VGJ-00UWl1; Fri, 01
 Jul 2022 22:23:54 +0200
From:   Helge Deller <deller@gmx.de>
To:     geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
        daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 4/4] fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible()
Date:   Fri,  1 Jul 2022 22:23:52 +0200
Message-Id: <20220701202352.559808-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220701202352.559808-1-deller@gmx.de>
References: <20220701202352.559808-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JlLS9An8ORqm99gZ3g8xrQRMSdmqUYZiGP99A8+AFH4NJ2CBlnH
 LDEYQPy+5IoyRbllFYZhnpoxFbbClTpc/MvvV9idwnZoRwTPxd2ed6gZw99OdqzXOc3zvIS
 gJh9bQVObGeoDWxSvIrvFieC7q/AazgLwqe3nT7X8wFdTnkL7xfjTrxBtYCzrR6EacQ0A+8
 mHyYNXv3wjOkapFWk5aZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AwV6Ee3eOGA=:nwE2q14rcqA5wSPJOZWaCJ
 PMJ092+vDW4hFDuPZqf0Z47dkgHgrTXOzDoE8piKVD/v5xoVcn6IVcyqnwhv42EWwZ6168jHo
 5/J5IDzuHAhL5t9wkqSrinkq6owZ3cnydQYZNxKZYcC7aD0gNG5UMmlj/UNMtbIthvnrRlSA0
 Jr2vkIJZXrXZ09+5xgZsgCV1Zy/330Xh4zbyZpArumCYkJTGQx52B3F54jUcxenJcC2gM5QHz
 RmMBP2cqoiobES6weKFf7j06j+ZGKSa9dIdzE8cNqhUZ7M2d9zJozj3wWoH5L7W5GJwDiHpUK
 8MPYbWxv0kaWG+wIi1qE8+Wv6uNV2MBrorrcNzCxbRvLtDMdjj+WvpFOvkpZcVYT4OvqDaSaN
 wS7PYC2lqQwrCJlqWUrcG1mAmqrUm6kwgXXYI5eyoY0//EdGb4YytM6lC3ZpOACYD231zodW6
 QAykr+r6sCqnPBGcnbJRL7/6vq+iCyUfss0NjExl0u6EftyRfLDxF06HiAYYW2MnMUge8NgTQ
 rpf0MDeNDFlHsto/Obo51b8O0MSyEcj27APzUkreoLWH2piYFKD8Mx+gKEgCMtpDqbvZs3RXr
 pSwkYT0K9WDIueLxY109Gx5TmExKlWGLpEv80z/7Z1qgD2NlWXpwgamc2/sgsJe1S7wYl/70Y
 w+WJvUaeu+oCyqr4lsEVZtEF3F5imk4FsNn/mv+oF5kXLCZjFmIFKrOC4XjuHVm3/fKgxC36M
 c85n6fjz8eIS1bQq2Hh1mrWfMrOaUKqU1OHUm/JvrlwkFSBb5ck2yxImUmbE2P+5NXSL68CcZ
 43HHM4Zf8jfV8A1ziKEaBUdvyJLnqygL02VIXHX6c6ZR2ugCTdXdYf1thy8BsrNQQb+E5Px7K
 yfrJCptC2MIbI5yvh9LcfJ2ze4eDtoblL0UXNuL2Tkt37VixSCe4m37aVhaDuvKhImyc9Q/MD
 KrGj/MoswhrQ0KAR2mKlCglahFOPUKjS6yU5K3EZ0gp7p9RUCRLUTBVLyrLY2cEL7FyffbGtX
 q9fh3Y6aljMkWJdlZvxEgCB4pHbbCSdRzYqBBfoir06APOzLmarT6805gvw4oX25gp1X5vgBE
 Fj4XYQFLIgZd9XdUs4FKbQwaju5FmqFk83c68j0MpzdxYvri7zJQEmETQ==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Use the fbcon_info_from_console() wrapper which was added to kernel
v5.19 with commit 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_=
info lookup").

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
=2D--
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index 14b0ab51744f..7f2ebfa8a80a 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2752,7 +2752,7 @@ int fbcon_modechange_possible(struct fb_info *info, =
struct fb_var_screeninfo *va
 	for (i =3D first_fb_vc; i <=3D last_fb_vc; i++) {
 		vc =3D vc_cons[i].d;
 		if (!vc || vc->vc_mode !=3D KD_TEXT ||
-			   registered_fb[con2fb_map[i]] !=3D info)
+			   fbcon_info_from_console(i) !=3D info)
 			continue;

 		if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) =
||
=2D-
2.35.3

