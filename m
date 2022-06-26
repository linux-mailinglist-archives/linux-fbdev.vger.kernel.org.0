Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E7C55ACD7
	for <lists+linux-fbdev@lfdr.de>; Sun, 26 Jun 2022 00:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbiFYWGk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 25 Jun 2022 18:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbiFYWGj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 25 Jun 2022 18:06:39 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D24120B9
        for <linux-fbdev@vger.kernel.org>; Sat, 25 Jun 2022 15:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656194792;
        bh=cL0l7EYk7Gr+7cdvpNWmUqqHHHMGkB914fzT0oYSaE8=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=Z6NjoG3JehTfC3JD3q18GSY45JR1RQqK9LqKyNDUiU+75NZrRyH2xsInl41Y2Xi1Q
         qiGrSxUOlst8F+pCe1wArVyOFL9lAfyVANGADu/msg71XpDumeN4k4Pr9FFruhaOaY
         cxXfn0qQInqewJGv7gA7G0neIBR4eh2+dck3qUMs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.162.44]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVN6t-1oCCBL0eBT-00SR0G; Sun, 26
 Jun 2022 00:06:32 +0200
From:   Helge Deller <deller@gmx.de>
To:     dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
        linux-fbdev@vger.kernel.org
Subject: [PATCH v3 4/4] fbmem: Prevent invalid virtual screen sizes
Date:   Sun, 26 Jun 2022 00:06:30 +0200
Message-Id: <20220625220630.333705-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220625220630.333705-1-deller@gmx.de>
References: <20220625220630.333705-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gquswi0ApXZgSzlnh0iSNH95/VhiqmO6Gpcab5NAlqj7elPx4BP
 5nXyjBNb59rvWQXoL8RIoB0B4Wj0EZjaDAsKRb8lVYPTApEn2Nf3wLtjBlS8VXkSAUa0QN+
 DKrleacuIaruWpsW3dqzyAsKx1BwOAfLVpeRPFwcbux0XPW73AfNO6NJKpoudSOZ2Zl6BnM
 xfjzEdYLN2KUDUzitUrMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b1zdCS+WlXY=:6CtS0Iew/H9ZY79ULxuL9V
 /5W25kw/OB9HWWV+3uhaMFScvM6NigKE4fzwyE/uIYrVHwwCbvJMwHac1DC4LFpu0PJGK39h+
 8uWhhBTklv9OFVWXCCJKOH5nWyY+HD7lbVLlctzHyt0GgDcD9exaD72seoAM8d25Dy+A7nmnx
 3blO6ls4hqBGiCohVh6sHZ/HLcnwQTvA2dt0KjNjhDuWNlrG4Z7IQoUm6rfvgtxuUASxbhLNh
 +nhSmkrbDPBwTi2joO2Q+Wl8T1nZfoDlUD7+TO1iEu2zMXfEJn9yrNnfBnV0lM1I3CNnhFxCa
 fLwn9o8HTCZU0gtEslk7jKEBfd+I/+8QS3mp9cFVfOrwfziY7iZvq9c09/vAieeggCwTbO1nx
 ETfilnhirEmDHHxPE7AW0WXn/c4PULCHWiANeE6IEEFHHDfXUxTTnox112lJ49p4/O6YNPmqX
 SmFwEyOQmKW3yfywFGySrA1j9/VlT5CWOyYTqjNQWPNRr8o6NRF/gGO+Piu7aU7IxM4Ngsa6q
 rKQUHzEhEcbjMtaTqwWfDsnSYL4dQTx/WiatpRsCn9jg/G0+gDbHNu3+/sIuo2TdVzrdg25CC
 p2m1zuVeu0sfB52Ufs8kOg/gTYe8BWht7GuxswSi+1e5YGJOWOYVvM/ERlKGMAw6OnTmZbQPN
 EZyIqUxqYfHnpZM0dpTekncrswcNr7bwXZ86vF+qHUVpEfSoSS1IhOkurLzV/3v4RH88ss4s1
 BRTWh3P3Hrbp4qRUCkWyn0uTMO8mQH7TwlPIu6vpcaJQWJryAp4lhRgIF6/jMkwu8JAo4UIlR
 qFtEFeWmdfl5xDrbn6JJWW2HjNfssAD2LV2ImH/SlxWi4SoWlrk8j6p6bJ6UB2hDngyoPVQLs
 vjulhUa6MIktxI8qxIm04JG1X8ZqWSCPwI4AYnguZPv18r0HmJqCwDvuuDdvRDqy8bX71kZnt
 BItz6Rurl6p31SYNAx3fz+YeeODOc4UCYCB6gGG1JdvHS9qdJDLQWjrUaUZq+lAh3CbHKAmfs
 Ef1UKTilCR1uFRQFX3qHgEb9TJUeRAb2GlwBeStAd9drESk5vERCQbb9JlYqKEz75sOzBCagK
 4Y4WQIXQ+NKcGhKlfFKtZux44CkRpUch4hn0cHzaG2JUWhL83e7I9mnFA==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Prevent that drivers or the user sets the virtual screen resolution
smaller than the physical screen resolution.  This is important, because
otherwise we may get accesses outside of the graphics memory area.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbmem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index 160389365a36..b6e1d0f2b974 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_scre=
eninfo *var)
 	if (var->xres < 8 || var->yres < 8)
 		return -EINVAL;

+	/* make sure virtual resolution >=3D physical resolution */
+	if (var->xres_virtual < var->xres)
+		return -EINVAL;
+	if (var->yres_virtual < var->yres)
+		return -EINVAL;
+
 	/* Too huge resolution causes multiplication overflow. */
 	if (check_mul_overflow(var->xres, var->yres, &unused) ||
 	    check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused))
=2D-
2.35.3

