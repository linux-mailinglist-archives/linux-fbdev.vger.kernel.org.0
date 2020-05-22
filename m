Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F2D1DDEA5
	for <lists+linux-fbdev@lfdr.de>; Fri, 22 May 2020 06:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgEVEPK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 22 May 2020 00:15:10 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4058 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbgEVEPJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 22 May 2020 00:15:09 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ec7513c0001>; Thu, 21 May 2020 21:12:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 21 May 2020 21:15:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 21 May 2020 21:15:09 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 May
 2020 04:15:09 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 22 May 2020 04:15:08 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.182]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ec751cc0001>; Thu, 21 May 2020 21:15:08 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     LKML <linux-kernel@vger.kernel.org>
CC:     John Hubbard <jhubbard@nvidia.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        Jani Nikula <jani.nikula@intel.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: [PATCH 1/2] video: fbdev: fix error handling for get_user_pages_fast()
Date:   Thu, 21 May 2020 21:15:05 -0700
Message-ID: <20200522041506.39638-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522041506.39638-1-jhubbard@nvidia.com>
References: <20200522041506.39638-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590120764; bh=lgtvms+evwCjD3x/lZ3Ysebw94Ksle/umtDMCsm3L+c=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Z4x5Qx/GuV0Tog+KoMSLIucx2GzopLPT8awTgV0oqpYYTz5l7IXS8Dayvgwys0vkK
         WJ1Tp/Vgx19mTdabiGSlUgiJK8HYhoFk0NrUI6B6YBFK8/UahHC/HGCNGKUcGHNlzw
         xCgpmeNtJOD4zXoTeW0ZMCXbdRQQADn2c2+eZ7ITFgOttpe4KUCrExBiKlZGcqOXy6
         m7GU/PkAC17Ymq5o4LbX4haeiPBJ/FZOG9B8qgeoCClFq3e4jimzfv/Etn6myKy3jh
         YdscZLVAGMAQt16da8HdU6N/r8QrZtHRjbc3UjbIzcG0+5Ol62LxmUIExoSe9bYKKm
         yuPbNSfgmaIpw==
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Dealing with the return value of get_user_pages*() variants has a few
classic pitfalls, and this driver found one of them: the return value
might be zero, positive, or -errno. And if positive, it might be fewer
pages than were requested. And if fewer pages than requested, then
the caller should return (via put_page()) the pages that *were*
pinned.

This driver was doing that *except* that it had a problem with the
-errno case, which was being stored in an unsigned int, and which
would case an interesting mess if it ever happened: nr_pages would be
interpreted as a spectacularly huge unsigned value, rather than a
small negative value. Also, it was unnecessarily overriding a
potentially informative -errno, with -EINVAL, in some cases.

Instead: clamp the nr_pages to zero or positive, so that the error
handling works. And return the -errno value from get_user_pages*(),
unchanged, if we get one. And explain this with comments, seeing as
how it is error-prone.

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/video/fbdev/pvr2fb.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index f18d457175d9..ceb6ef590597 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -654,8 +654,22 @@ static ssize_t pvr2fb_write(struct fb_info *info, cons=
t char *buf,
=20
 	ret =3D get_user_pages_fast((unsigned long)buf, nr_pages, FOLL_WRITE, pag=
es);
 	if (ret < nr_pages) {
-		nr_pages =3D ret;
-		ret =3D -EINVAL;
+		if (ret < 0) {
+			/*
+			 *  Clamp the unsigned nr_pages to zero so that the
+			 *  error handling works. And leave ret at whatever
+			 *  -errno value was returned from GUP.
+			 */
+			nr_pages =3D 0;
+		} else {
+			nr_pages =3D ret;
+			/*
+			 * Use -EINVAL to represent a mildly desperate guess at
+			 * why we got fewer pages (maybe even zero pages) than
+			 * requested.
+			 */
+			ret =3D -EINVAL;
+		}
 		goto out_unmap;
 	}
=20
--=20
2.26.2

