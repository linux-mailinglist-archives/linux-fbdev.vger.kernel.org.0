Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A3B26FA38
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Sep 2020 12:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIRKPN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Sep 2020 06:15:13 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:36475 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgIRKPN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Sep 2020 06:15:13 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M1q8m-1kLQG00GBU-002Jcp; Fri, 18 Sep 2020 12:09:44 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, hch@lst.de,
        linux-kernel@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/3] fbdev: sbuslib: remove compat_alloc_user_space usage
Date:   Fri, 18 Sep 2020 12:09:06 +0200
Message-Id: <20200918100926.1447563-3-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200918100812.1447443-1-arnd@arndb.de>
References: <20200918100812.1447443-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HKl3xxYSvyhA+JIl+nlo9qpNjrLsxo9vURIHerUOHnl60TdZkan
 tzIABrGkg/YRq17ShVdHy9rPV3ryj1yGdazrJOt8995wSQs5asRLOTG1fOjR2FLcsmZNRR2
 l06hFlOQJDBUmwZvw35WRKJXxxSA7BHxfImIE3u1cpI1T9V0YB3ttyb5TMB1usfqWb00KGk
 N3kjYIIgYEOuRSiFZ5gYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZctDqYWVmpc=:r9XG7x9rA9E56PRm2DddDG
 +9fQemgMOQsCR023LYVVbTHjvIYF5Ms0wNHGgAneOJGgba4BURko/x6dync7YO+5RaAnZ0xD8
 U+K8G+zGVJTIHCtCpXAKIjCZ9eT8nrFHMA03HDDKwbvy5DUUTViq/8m0iHMyIOAPlO1M3kL50
 Q/BBQ+CiS65xUfQHluubRUkBe+YIk87O6gKqTRkmyoG0ithn+GMv3bjJsjTyQRQvJNb1tIT4x
 Qs39Hvjyg4tR0I3CUTE8qIfA0n/IercCVePGMVQ3/1nSSq3myf6r5ym6K7TGrKXYvkjEW+Aop
 p7I+8kuTN/+WsmKec5BTEkY7r3y0AznbzLRkzLSai7w+R3LL1nOt4yL1uGKkLZJMoT+yC5mMj
 WdW5wQe92A75AuQN04tcSFCMRnoYKuyMLZ1zN0mq0kLMuXS5ptVgKUaSuiZ38rZlqgYyqTMig
 kXK3/dn3uLrg+fgOX1WmrlJe+F2BRC1gNZxSl5gSr3SwaeDLxwgHCTWWwMeATffZdJCLPGLho
 jXH3kdhzxTtoCGCfnqrUjujAVbC8XjVVpuDWRp149Dimcsj5GhSL7h8ASDc1dUV15rs30FJxR
 gpIBdxH4AnGZ1Rlp/BUKG910X2nccfw1IrFS0/JxDDkj+9kVQCy5jDPfsBvatMa+a21MOL0kb
 Usjavt2gqp63ekue8fUZYnrMUqzb/GVFpLWkc13d6fZEFV4a3t2Q4L8/iKhho+E2uueKLgaLR
 jg6p6lval73a6tOXGHccOqKprtITAp6BCjRsL46yOpcGwHKXwYHnPXGng7cO5yUUtrnEE19B1
 5U3dKwUOM46slqVTjHjXN94gWT3T5/xXUhWEFz+J0xewczI8nmpKNk6gJ5EhOMMUff0aLWH
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is one of the last users of compat_alloc_user_space()
and copy_in_user(). The actual handler is implemented in the
same file and could be shared, but as I couldn't test this
properly I leave the native case alone and just make a straight
copy of it for the compat case, with a minimum set of
modifications.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/sbuslib.c | 95 ++++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 25 deletions(-)

diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index f728db9bcff8..da28c279a54b 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -192,28 +192,6 @@ int sbusfb_ioctl_helper(unsigned long cmd, unsigned long arg,
 EXPORT_SYMBOL(sbusfb_ioctl_helper);
 
 #ifdef CONFIG_COMPAT
-static int fbiogetputcmap(struct fb_info *info, unsigned int cmd, unsigned long arg)
-{
-	struct fbcmap32 __user *argp = (void __user *)arg;
-	struct fbcmap __user *p = compat_alloc_user_space(sizeof(*p));
-	u32 addr;
-	int ret;
-
-	ret = copy_in_user(p, argp, 2 * sizeof(int));
-	ret |= get_user(addr, &argp->red);
-	ret |= put_user(compat_ptr(addr), &p->red);
-	ret |= get_user(addr, &argp->green);
-	ret |= put_user(compat_ptr(addr), &p->green);
-	ret |= get_user(addr, &argp->blue);
-	ret |= put_user(compat_ptr(addr), &p->blue);
-	if (ret)
-		return -EFAULT;
-	return info->fbops->fb_ioctl(info,
-			(cmd == FBIOPUTCMAP32) ?
-			FBIOPUTCMAP_SPARC : FBIOGETCMAP_SPARC,
-			(unsigned long)p);
-}
-
 int sbusfb_compat_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
@@ -230,9 +208,76 @@ int sbusfb_compat_ioctl(struct fb_info *info, unsigned int cmd, unsigned long ar
 	case FBIOGCURMAX:
 		return info->fbops->fb_ioctl(info, cmd, arg);
 	case FBIOPUTCMAP32:
-		return fbiogetputcmap(info, cmd, arg);
-	case FBIOGETCMAP32:
-		return fbiogetputcmap(info, cmd, arg);
+	case FBIOPUTCMAP_SPARC: {
+		struct fbcmap32 c;
+		struct fb_cmap cmap;
+		u16 red, green, blue;
+		u8 red8, green8, blue8;
+		unsigned char __user *ured;
+		unsigned char __user *ugreen;
+		unsigned char __user *ublue;
+		unsigned int i;
+
+		if (copy_from_user(&c, compat_ptr(arg), sizeof(c)))
+		       return -EFAULT;
+		ured = compat_ptr(c.red);
+		ugreen = compat_ptr(c.green);
+		ublue = compat_ptr(c.blue);
+
+		cmap.len = 1;
+		cmap.red = &red;
+		cmap.green = &green;
+		cmap.blue = &blue;
+		cmap.transp = NULL;
+		for (i = 0; i < c.count; i++) {
+			int err;
+
+			if (get_user(red8, &ured[i]) ||
+			    get_user(green8, &ugreen[i]) ||
+			    get_user(blue8, &ublue[i]))
+				return -EFAULT;
+
+			red = red8 << 8;
+			green = green8 << 8;
+			blue = blue8 << 8;
+
+			cmap.start = c.index + i;
+			err = fb_set_cmap(&cmap, info);
+			if (err)
+				return err;
+		}
+		return 0;
+	}
+	case FBIOGETCMAP32: {
+		struct fbcmap32 c;
+		unsigned char __user *ured;
+		unsigned char __user *ugreen;
+		unsigned char __user *ublue;
+		struct fb_cmap *cmap = &info->cmap;
+		unsigned int index, i;
+		u8 red, green, blue;
+
+		if (copy_from_user(&c, compat_ptr(arg), sizeof(c)))
+		       return -EFAULT;
+		index = c.index;
+		ured = compat_ptr(c.red);
+		ugreen = compat_ptr(c.green);
+		ublue = compat_ptr(c.blue);
+
+		if (index > cmap->len || c.count > cmap->len - index)
+			return -EINVAL;
+
+		for (i = 0; i < c.count; i++) {
+			red = cmap->red[index + i] >> 8;
+			green = cmap->green[index + i] >> 8;
+			blue = cmap->blue[index + i] >> 8;
+			if (put_user(red, &ured[i]) ||
+			    put_user(green, &ugreen[i]) ||
+			    put_user(blue, &ublue[i]))
+				return -EFAULT;
+		}
+		return 0;
+	}
 	default:
 		return -ENOIOCTLCMD;
 	}
-- 
2.27.0

