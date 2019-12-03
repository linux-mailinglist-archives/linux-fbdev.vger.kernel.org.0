Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 433F6110296
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Dec 2019 17:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfLCQj6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Dec 2019 11:39:58 -0500
Received: from mga07.intel.com ([134.134.136.100]:56523 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbfLCQj5 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 3 Dec 2019 11:39:57 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:39:55 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; 
   d="scan'208";a="222881577"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:39:50 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 08/12] video: constify fb ops across all drivers
Date:   Tue,  3 Dec 2019 18:38:50 +0200
Message-Id: <ce67f14435f3af498f2e8bf35ce4be11f7504132.1575390740.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Now that the fbops member of struct fb_info is const, we can start
making the ops const as well.

This does not cover all drivers; some actually modify the fbops struct,
for example to adjust for different configurations, and others do more
involved things that I'd rather not touch in practically obsolete
drivers. Mostly this is the low hanging fruit where we can add "const"
and be done with it.

v3:
- un-constify atyfb, mb862xx, nvidia and uvesabf (0day)

v2:
- fix typo (Christophe de Dinechin)
- use "static const" instead of "const static" in mx3fb.c
- also constify smscufx.c

Cc: linux-fbdev@vger.kernel.org
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/68328fb.c                  | 2 +-
 drivers/video/fbdev/acornfb.c                  | 2 +-
 drivers/video/fbdev/amba-clcd.c                | 2 +-
 drivers/video/fbdev/amifb.c                    | 2 +-
 drivers/video/fbdev/arcfb.c                    | 2 +-
 drivers/video/fbdev/arkfb.c                    | 2 +-
 drivers/video/fbdev/asiliantfb.c               | 2 +-
 drivers/video/fbdev/atmel_lcdfb.c              | 2 +-
 drivers/video/fbdev/aty/aty128fb.c             | 2 +-
 drivers/video/fbdev/aty/radeon_base.c          | 2 +-
 drivers/video/fbdev/au1100fb.c                 | 2 +-
 drivers/video/fbdev/au1200fb.c                 | 2 +-
 drivers/video/fbdev/broadsheetfb.c             | 2 +-
 drivers/video/fbdev/bw2.c                      | 2 +-
 drivers/video/fbdev/carminefb.c                | 2 +-
 drivers/video/fbdev/cg14.c                     | 2 +-
 drivers/video/fbdev/cg3.c                      | 2 +-
 drivers/video/fbdev/cg6.c                      | 2 +-
 drivers/video/fbdev/chipsfb.c                  | 2 +-
 drivers/video/fbdev/cirrusfb.c                 | 2 +-
 drivers/video/fbdev/clps711x-fb.c              | 2 +-
 drivers/video/fbdev/cobalt_lcdfb.c             | 2 +-
 drivers/video/fbdev/controlfb.c                | 2 +-
 drivers/video/fbdev/cyber2000fb.c              | 2 +-
 drivers/video/fbdev/da8xx-fb.c                 | 2 +-
 drivers/video/fbdev/dnfb.c                     | 2 +-
 drivers/video/fbdev/efifb.c                    | 2 +-
 drivers/video/fbdev/ep93xx-fb.c                | 2 +-
 drivers/video/fbdev/fb-puv3.c                  | 2 +-
 drivers/video/fbdev/ffb.c                      | 2 +-
 drivers/video/fbdev/fm2fb.c                    | 2 +-
 drivers/video/fbdev/fsl-diu-fb.c               | 2 +-
 drivers/video/fbdev/g364fb.c                   | 2 +-
 drivers/video/fbdev/gbefb.c                    | 2 +-
 drivers/video/fbdev/geode/gx1fb_core.c         | 2 +-
 drivers/video/fbdev/geode/gxfb_core.c          | 2 +-
 drivers/video/fbdev/geode/lxfb_core.c          | 2 +-
 drivers/video/fbdev/goldfishfb.c               | 2 +-
 drivers/video/fbdev/grvga.c                    | 2 +-
 drivers/video/fbdev/gxt4500.c                  | 2 +-
 drivers/video/fbdev/hecubafb.c                 | 2 +-
 drivers/video/fbdev/hgafb.c                    | 2 +-
 drivers/video/fbdev/hitfb.c                    | 2 +-
 drivers/video/fbdev/hpfb.c                     | 2 +-
 drivers/video/fbdev/hyperv_fb.c                | 2 +-
 drivers/video/fbdev/i740fb.c                   | 2 +-
 drivers/video/fbdev/imsttfb.c                  | 2 +-
 drivers/video/fbdev/imxfb.c                    | 2 +-
 drivers/video/fbdev/intelfb/intelfbdrv.c       | 2 +-
 drivers/video/fbdev/kyro/fbdev.c               | 2 +-
 drivers/video/fbdev/leo.c                      | 2 +-
 drivers/video/fbdev/macfb.c                    | 2 +-
 drivers/video/fbdev/matrox/matroxfb_crtc2.c    | 2 +-
 drivers/video/fbdev/maxinefb.c                 | 2 +-
 drivers/video/fbdev/mbx/mbxfb.c                | 2 +-
 drivers/video/fbdev/metronomefb.c              | 2 +-
 drivers/video/fbdev/mmp/fb/mmpfb.c             | 2 +-
 drivers/video/fbdev/mx3fb.c                    | 5 +++--
 drivers/video/fbdev/neofb.c                    | 2 +-
 drivers/video/fbdev/ocfb.c                     | 2 +-
 drivers/video/fbdev/offb.c                     | 2 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c | 2 +-
 drivers/video/fbdev/p9100.c                    | 2 +-
 drivers/video/fbdev/platinumfb.c               | 2 +-
 drivers/video/fbdev/pm2fb.c                    | 2 +-
 drivers/video/fbdev/pm3fb.c                    | 2 +-
 drivers/video/fbdev/pmag-aa-fb.c               | 2 +-
 drivers/video/fbdev/pmag-ba-fb.c               | 2 +-
 drivers/video/fbdev/pmagb-b-fb.c               | 2 +-
 drivers/video/fbdev/ps3fb.c                    | 2 +-
 drivers/video/fbdev/pvr2fb.c                   | 2 +-
 drivers/video/fbdev/pxa168fb.c                 | 2 +-
 drivers/video/fbdev/pxafb.c                    | 4 ++--
 drivers/video/fbdev/q40fb.c                    | 2 +-
 drivers/video/fbdev/riva/fbdev.c               | 2 +-
 drivers/video/fbdev/s3c-fb.c                   | 2 +-
 drivers/video/fbdev/s3c2410fb.c                | 2 +-
 drivers/video/fbdev/s3fb.c                     | 2 +-
 drivers/video/fbdev/sa1100fb.c                 | 2 +-
 drivers/video/fbdev/savage/savagefb_driver.c   | 2 +-
 drivers/video/fbdev/sh7760fb.c                 | 2 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c         | 4 ++--
 drivers/video/fbdev/simplefb.c                 | 2 +-
 drivers/video/fbdev/sis/sis_main.c             | 2 +-
 drivers/video/fbdev/skeletonfb.c               | 2 +-
 drivers/video/fbdev/sm712fb.c                  | 2 +-
 drivers/video/fbdev/smscufx.c                  | 2 +-
 drivers/video/fbdev/ssd1307fb.c                | 2 +-
 drivers/video/fbdev/sstfb.c                    | 2 +-
 drivers/video/fbdev/stifb.c                    | 2 +-
 drivers/video/fbdev/sunxvr1000.c               | 2 +-
 drivers/video/fbdev/sunxvr2500.c               | 2 +-
 drivers/video/fbdev/sunxvr500.c                | 2 +-
 drivers/video/fbdev/tcx.c                      | 2 +-
 drivers/video/fbdev/tdfxfb.c                   | 2 +-
 drivers/video/fbdev/tgafb.c                    | 2 +-
 drivers/video/fbdev/tmiofb.c                   | 2 +-
 drivers/video/fbdev/tridentfb.c                | 2 +-
 drivers/video/fbdev/valkyriefb.c               | 2 +-
 drivers/video/fbdev/vfb.c                      | 2 +-
 drivers/video/fbdev/vga16fb.c                  | 2 +-
 drivers/video/fbdev/vt8500lcdfb.c              | 2 +-
 drivers/video/fbdev/vt8623fb.c                 | 2 +-
 drivers/video/fbdev/w100fb.c                   | 2 +-
 drivers/video/fbdev/wm8505fb.c                 | 2 +-
 drivers/video/fbdev/xen-fbfront.c              | 2 +-
 drivers/video/fbdev/xilinxfb.c                 | 2 +-
 107 files changed, 111 insertions(+), 110 deletions(-)

diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
index d48e96088f76..491fd5a82993 100644
--- a/drivers/video/fbdev/68328fb.c
+++ b/drivers/video/fbdev/68328fb.c
@@ -96,7 +96,7 @@ static int mc68x328fb_pan_display(struct fb_var_screeninfo *var,
 			   struct fb_info *info);
 static int mc68x328fb_mmap(struct fb_info *info, struct vm_area_struct *vma);
 
-static struct fb_ops mc68x328fb_ops = {
+static const struct fb_ops mc68x328fb_ops = {
 	.fb_check_var	= mc68x328fb_check_var,
 	.fb_set_par	= mc68x328fb_set_par,
 	.fb_setcolreg	= mc68x328fb_setcolreg,
diff --git a/drivers/video/fbdev/acornfb.c b/drivers/video/fbdev/acornfb.c
index 7cacae5a8797..a3af49529173 100644
--- a/drivers/video/fbdev/acornfb.c
+++ b/drivers/video/fbdev/acornfb.c
@@ -604,7 +604,7 @@ acornfb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops acornfb_ops = {
+static const struct fb_ops acornfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= acornfb_check_var,
 	.fb_set_par	= acornfb_set_par,
diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index 7de43be6ef2c..c3d55fc6c4e0 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -423,7 +423,7 @@ static int clcdfb_mmap(struct fb_info *info,
 	return ret;
 }
 
-static struct fb_ops clcdfb_ops = {
+static const struct fb_ops clcdfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= clcdfb_check_var,
 	.fb_set_par	= clcdfb_set_par,
diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index 91ddc9602014..20e03e00b66d 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3493,7 +3493,7 @@ static irqreturn_t amifb_interrupt(int irq, void *dev_id)
 }
 
 
-static struct fb_ops amifb_ops = {
+static const struct fb_ops amifb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= amifb_check_var,
 	.fb_set_par	= amifb_set_par,
diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index a48741aab240..314ab82e01c0 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -491,7 +491,7 @@ static ssize_t arcfb_write(struct fb_info *info, const char __user *buf,
 	return err;
 }
 
-static struct fb_ops arcfb_ops = {
+static const struct fb_ops arcfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= arcfb_open,
 	.fb_read        = fb_sys_read,
diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index f940e8b66b85..11ab9a153860 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -917,7 +917,7 @@ static int arkfb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info
 
 /* Frame buffer operations */
 
-static struct fb_ops arkfb_ops = {
+static const struct fb_ops arkfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= arkfb_open,
 	.fb_release	= arkfb_release,
diff --git a/drivers/video/fbdev/asiliantfb.c b/drivers/video/fbdev/asiliantfb.c
index ea31054a28ca..3e006da47752 100644
--- a/drivers/video/fbdev/asiliantfb.c
+++ b/drivers/video/fbdev/asiliantfb.c
@@ -95,7 +95,7 @@ static int asiliantfb_set_par(struct fb_info *info);
 static int asiliantfb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
 				u_int transp, struct fb_info *info);
 
-static struct fb_ops asiliantfb_ops = {
+static const struct fb_ops asiliantfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= asiliantfb_check_var,
 	.fb_set_par	= asiliantfb_set_par,
diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 5ff8e0320d95..d567f5d56c13 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -824,7 +824,7 @@ static int atmel_lcdfb_blank(int blank_mode, struct fb_info *info)
 	return ((blank_mode == FB_BLANK_NORMAL) ? 1 : 0);
 }
 
-static struct fb_ops atmel_lcdfb_ops = {
+static const struct fb_ops atmel_lcdfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= atmel_lcdfb_check_var,
 	.fb_set_par	= atmel_lcdfb_set_par,
diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index fc1e45d44719..d7e41c8dd533 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -509,7 +509,7 @@ static void aty128_bl_set_power(struct fb_info *info, int power);
 			  (readb(bios + (v) + 3) << 24))
 
 
-static struct fb_ops aty128fb_ops = {
+static const struct fb_ops aty128fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= aty128fb_check_var,
 	.fb_set_par	= aty128fb_set_par,
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 4ca07866f2f6..3af00e3b965e 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -1965,7 +1965,7 @@ static int radeonfb_set_par(struct fb_info *info)
 }
 
 
-static struct fb_ops radeonfb_ops = {
+static const struct fb_ops radeonfb_ops = {
 	.owner			= THIS_MODULE,
 	.fb_check_var		= radeonfb_check_var,
 	.fb_set_par		= radeonfb_set_par,
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 99941ae1f3a1..37a6512feda0 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -348,7 +348,7 @@ int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
 			fbdev->fb_len);
 }
 
-static struct fb_ops au1100fb_ops =
+static const struct fb_ops au1100fb_ops =
 {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= au1100fb_fb_setcolreg,
diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 265d3b45efd0..c00e01a17368 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1483,7 +1483,7 @@ static int au1200fb_ioctl(struct fb_info *info, unsigned int cmd,
 }
 
 
-static struct fb_ops au1200fb_fb_ops = {
+static const struct fb_ops au1200fb_fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= au1200fb_fb_check_var,
 	.fb_set_par	= au1200fb_fb_set_par,
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index d6ba348deb9f..fd66f4d4a621 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1048,7 +1048,7 @@ static ssize_t broadsheetfb_write(struct fb_info *info, const char __user *buf,
 	return (err) ? err : count;
 }
 
-static struct fb_ops broadsheetfb_ops = {
+static const struct fb_ops broadsheetfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_read        = fb_sys_read,
 	.fb_write	= broadsheetfb_write,
diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
index 436f10f3d375..0d9a6bb57a09 100644
--- a/drivers/video/fbdev/bw2.c
+++ b/drivers/video/fbdev/bw2.c
@@ -37,7 +37,7 @@ static int bw2_ioctl(struct fb_info *, unsigned int, unsigned long);
  *  Frame buffer operations
  */
 
-static struct fb_ops bw2_ops = {
+static const struct fb_ops bw2_ops = {
 	.owner			= THIS_MODULE,
 	.fb_blank		= bw2_blank,
 	.fb_fillrect		= cfb_fillrect,
diff --git a/drivers/video/fbdev/carminefb.c b/drivers/video/fbdev/carminefb.c
index 9f3be0258623..bf3f2a9598b1 100644
--- a/drivers/video/fbdev/carminefb.c
+++ b/drivers/video/fbdev/carminefb.c
@@ -527,7 +527,7 @@ static int init_hardware(struct carmine_hw *hw)
 	return 0;
 }
 
-static struct fb_ops carminefb_ops = {
+static const struct fb_ops carminefb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_fillrect	= cfb_fillrect,
 	.fb_copyarea	= cfb_copyarea,
diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
index d80d99db3a46..a620b51cf7d0 100644
--- a/drivers/video/fbdev/cg14.c
+++ b/drivers/video/fbdev/cg14.c
@@ -39,7 +39,7 @@ static int cg14_pan_display(struct fb_var_screeninfo *, struct fb_info *);
  *  Frame buffer operations
  */
 
-static struct fb_ops cg14_ops = {
+static const struct fb_ops cg14_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= cg14_setcolreg,
 	.fb_pan_display		= cg14_pan_display,
diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index 09f616dddfd7..77f6470ce665 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -39,7 +39,7 @@ static int cg3_ioctl(struct fb_info *, unsigned int, unsigned long);
  *  Frame buffer operations
  */
 
-static struct fb_ops cg3_ops = {
+static const struct fb_ops cg3_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= cg3_setcolreg,
 	.fb_blank		= cg3_blank,
diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
index d5888aecc2fb..a1c68cd48d7e 100644
--- a/drivers/video/fbdev/cg6.c
+++ b/drivers/video/fbdev/cg6.c
@@ -44,7 +44,7 @@ static int cg6_pan_display(struct fb_var_screeninfo *, struct fb_info *);
  *  Frame buffer operations
  */
 
-static struct fb_ops cg6_ops = {
+static const struct fb_ops cg6_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= cg6_setcolreg,
 	.fb_blank		= cg6_blank,
diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index f4dc320dcafe..998067b701fa 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -79,7 +79,7 @@ static int chipsfb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
 			     u_int transp, struct fb_info *info);
 static int chipsfb_blank(int blank, struct fb_info *info);
 
-static struct fb_ops chipsfb_ops = {
+static const struct fb_ops chipsfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= chipsfb_check_var,
 	.fb_set_par	= chipsfb_set_par,
diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index e4ce5667b125..c3a3e344cee3 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -1956,7 +1956,7 @@ static void cirrusfb_zorro_unmap(struct fb_info *info)
 #endif /* CONFIG_ZORRO */
 
 /* function table of the above functions */
-static struct fb_ops cirrusfb_ops = {
+static const struct fb_ops cirrusfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= cirrusfb_open,
 	.fb_release	= cirrusfb_release,
diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
index cabbc721f894..c5d15c6db287 100644
--- a/drivers/video/fbdev/clps711x-fb.c
+++ b/drivers/video/fbdev/clps711x-fb.c
@@ -153,7 +153,7 @@ static int clps711x_fb_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops clps711x_fb_ops = {
+static const struct fb_ops clps711x_fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= clps711x_fb_setcolreg,
 	.fb_check_var	= clps711x_fb_check_var,
diff --git a/drivers/video/fbdev/cobalt_lcdfb.c b/drivers/video/fbdev/cobalt_lcdfb.c
index 544946901e8b..5f8b6324d2e8 100644
--- a/drivers/video/fbdev/cobalt_lcdfb.c
+++ b/drivers/video/fbdev/cobalt_lcdfb.c
@@ -269,7 +269,7 @@ static int cobalt_lcdfb_cursor(struct fb_info *info, struct fb_cursor *cursor)
 	return 0;
 }
 
-static struct fb_ops cobalt_lcd_fbops = {
+static const struct fb_ops cobalt_lcd_fbops = {
 	.owner		= THIS_MODULE,
 	.fb_read	= cobalt_lcdfb_read,
 	.fb_write	= cobalt_lcdfb_write,
diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 9a680ef3ffc3..38b61cdb5ca4 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -157,7 +157,7 @@ static int default_vmode __initdata = VMODE_NVRAM;
 static int default_cmode __initdata = CMODE_NVRAM;
 
 
-static struct fb_ops controlfb_ops = {
+static const struct fb_ops controlfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= controlfb_check_var,
 	.fb_set_par	= controlfb_set_par,
diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 3a2d9ff0aa42..460826a7ad55 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1060,7 +1060,7 @@ static int cyber2000fb_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops cyber2000fb_ops = {
+static const struct fb_ops cyber2000fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= cyber2000fb_check_var,
 	.fb_set_par	= cyber2000fb_set_par,
diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index 2d3dcc52fcf3..73c3c4c8cc12 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1294,7 +1294,7 @@ static int da8xxfb_set_par(struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops da8xx_fb_ops = {
+static const struct fb_ops da8xx_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_check_var = fb_check_var,
 	.fb_set_par = da8xxfb_set_par,
diff --git a/drivers/video/fbdev/dnfb.c b/drivers/video/fbdev/dnfb.c
index 8da517eaa4a3..3688f9165848 100644
--- a/drivers/video/fbdev/dnfb.c
+++ b/drivers/video/fbdev/dnfb.c
@@ -108,7 +108,7 @@
 static int dnfb_blank(int blank, struct fb_info *info);
 static void dnfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
 
-static struct fb_ops dn_fb_ops = {
+static const struct fb_ops dn_fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_blank	= dnfb_blank,
 	.fb_fillrect	= cfb_fillrect,
diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 51d97ec4f58f..f03f9fb60c26 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -255,7 +255,7 @@ static void efifb_destroy(struct fb_info *info)
 	fb_dealloc_cmap(&info->cmap);
 }
 
-static struct fb_ops efifb_ops = {
+static const struct fb_ops efifb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_destroy	= efifb_destroy,
 	.fb_setcolreg	= efifb_setcolreg,
diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index d04a047094fc..cda2ef337423 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -402,7 +402,7 @@ static int ep93xxfb_setcolreg(unsigned int regno, unsigned int red,
 	return 0;
 }
 
-static struct fb_ops ep93xxfb_ops = {
+static const struct fb_ops ep93xxfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= ep93xxfb_check_var,
 	.fb_set_par	= ep93xxfb_set_par,
diff --git a/drivers/video/fbdev/fb-puv3.c b/drivers/video/fbdev/fb-puv3.c
index fa62c4dff7d1..75df6aabac21 100644
--- a/drivers/video/fbdev/fb-puv3.c
+++ b/drivers/video/fbdev/fb-puv3.c
@@ -644,7 +644,7 @@ int unifb_mmap(struct fb_info *info,
 	return vm_iomap_memory(vma, info->fix.smem_start, info->fix.smem_len);
 }
 
-static struct fb_ops unifb_ops = {
+static const struct fb_ops unifb_ops = {
 	.fb_read        = fb_sys_read,
 	.fb_write       = fb_sys_write,
 	.fb_check_var	= unifb_check_var,
diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
index cd2d1db239a2..948b73184433 100644
--- a/drivers/video/fbdev/ffb.c
+++ b/drivers/video/fbdev/ffb.c
@@ -44,7 +44,7 @@ static int ffb_pan_display(struct fb_var_screeninfo *, struct fb_info *);
  *  Frame buffer operations
  */
 
-static struct fb_ops ffb_ops = {
+static const struct fb_ops ffb_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= ffb_setcolreg,
 	.fb_blank		= ffb_blank,
diff --git a/drivers/video/fbdev/fm2fb.c b/drivers/video/fbdev/fm2fb.c
index ac7a4ebfd390..3b727d528fde 100644
--- a/drivers/video/fbdev/fm2fb.c
+++ b/drivers/video/fbdev/fm2fb.c
@@ -165,7 +165,7 @@ static int fm2fb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
                            u_int transp, struct fb_info *info);
 static int fm2fb_blank(int blank, struct fb_info *info);
 
-static struct fb_ops fm2fb_ops = {
+static const struct fb_ops fm2fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= fm2fb_setcolreg,
 	.fb_blank	= fm2fb_blank,
diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index d19f58263b4e..7cacabdd5f12 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1448,7 +1448,7 @@ static int fsl_diu_release(struct fb_info *info, int user)
 	return res;
 }
 
-static struct fb_ops fsl_diu_ops = {
+static const struct fb_ops fsl_diu_ops = {
 	.owner = THIS_MODULE,
 	.fb_check_var = fsl_diu_check_var,
 	.fb_set_par = fsl_diu_set_par,
diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
index 223896cc5f7d..845b79da2a7c 100644
--- a/drivers/video/fbdev/g364fb.c
+++ b/drivers/video/fbdev/g364fb.c
@@ -111,7 +111,7 @@ static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
 static int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor);
 static int g364fb_blank(int blank, struct fb_info *info);
 
-static struct fb_ops g364fb_ops = {
+static const struct fb_ops g364fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= g364fb_setcolreg,
 	.fb_pan_display	= g364fb_pan_display,
diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index b9f6a82a0495..31270a8986e8 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1044,7 +1044,7 @@ static int gbefb_mmap(struct fb_info *info,
 	return 0;
 }
 
-static struct fb_ops gbefb_ops = {
+static const struct fb_ops gbefb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= gbefb_check_var,
 	.fb_set_par	= gbefb_set_par,
diff --git a/drivers/video/fbdev/geode/gx1fb_core.c b/drivers/video/fbdev/geode/gx1fb_core.c
index 737e472fac14..5d34d89fb665 100644
--- a/drivers/video/fbdev/geode/gx1fb_core.c
+++ b/drivers/video/fbdev/geode/gx1fb_core.c
@@ -252,7 +252,7 @@ static int parse_panel_option(struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops gx1fb_ops = {
+static const struct fb_ops gx1fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= gx1fb_check_var,
 	.fb_set_par	= gx1fb_set_par,
diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index 435ce2aa4240..d38a148d4746 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -265,7 +265,7 @@ static int gxfb_map_video_memory(struct fb_info *info, struct pci_dev *dev)
 	return 0;
 }
 
-static struct fb_ops gxfb_ops = {
+static const struct fb_ops gxfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= gxfb_check_var,
 	.fb_set_par	= gxfb_set_par,
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index b0f07d676eb3..adc2d9c2395e 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -386,7 +386,7 @@ static int lxfb_map_video_memory(struct fb_info *info, struct pci_dev *dev)
 	return 0;
 }
 
-static struct fb_ops lxfb_ops = {
+static const struct fb_ops lxfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= lxfb_check_var,
 	.fb_set_par	= lxfb_set_par,
diff --git a/drivers/video/fbdev/goldfishfb.c b/drivers/video/fbdev/goldfishfb.c
index f60ac276703d..9c83ec3f8e1f 100644
--- a/drivers/video/fbdev/goldfishfb.c
+++ b/drivers/video/fbdev/goldfishfb.c
@@ -160,7 +160,7 @@ static int goldfish_fb_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops goldfish_fb_ops = {
+static const struct fb_ops goldfish_fb_ops = {
 	.owner          = THIS_MODULE,
 	.fb_check_var   = goldfish_fb_check_var,
 	.fb_set_par     = goldfish_fb_set_par,
diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index d22e8b0c906d..07dda03e0957 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -251,7 +251,7 @@ static int grvga_pan_display(struct fb_var_screeninfo *var,
 	return 0;
 }
 
-static struct fb_ops grvga_ops = {
+static const struct fb_ops grvga_ops = {
 	.owner          = THIS_MODULE,
 	.fb_check_var   = grvga_check_var,
 	.fb_set_par	= grvga_set_par,
diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
index c7502fd8f447..13ded3a10708 100644
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -599,7 +599,7 @@ static const struct fb_fix_screeninfo gxt4500_fix = {
 	.mmio_len = 0x20000,
 };
 
-static struct fb_ops gxt4500_ops = {
+static const struct fb_ops gxt4500_ops = {
 	.owner = THIS_MODULE,
 	.fb_check_var = gxt4500_check_var,
 	.fb_set_par = gxt4500_set_par,
diff --git a/drivers/video/fbdev/hecubafb.c b/drivers/video/fbdev/hecubafb.c
index 8577195cb533..00d77105161a 100644
--- a/drivers/video/fbdev/hecubafb.c
+++ b/drivers/video/fbdev/hecubafb.c
@@ -197,7 +197,7 @@ static ssize_t hecubafb_write(struct fb_info *info, const char __user *buf,
 	return (err) ? err : count;
 }
 
-static struct fb_ops hecubafb_ops = {
+static const struct fb_ops hecubafb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_read        = fb_sys_read,
 	.fb_write	= hecubafb_write,
diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index 59e1cae57948..a45fcff1461f 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -523,7 +523,7 @@ static void hgafb_imageblit(struct fb_info *info, const struct fb_image *image)
 	}
 }
 
-static struct fb_ops hgafb_ops = {
+static const struct fb_ops hgafb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= hgafb_open,
 	.fb_release	= hgafb_release,
diff --git a/drivers/video/fbdev/hitfb.c b/drivers/video/fbdev/hitfb.c
index abe3e54d4506..009e5d2aa100 100644
--- a/drivers/video/fbdev/hitfb.c
+++ b/drivers/video/fbdev/hitfb.c
@@ -311,7 +311,7 @@ static int hitfb_set_par(struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops hitfb_ops = {
+static const struct fb_ops hitfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= hitfb_check_var,
 	.fb_set_par		= hitfb_set_par,
diff --git a/drivers/video/fbdev/hpfb.c b/drivers/video/fbdev/hpfb.c
index a79af8f069d1..f02be0db335e 100644
--- a/drivers/video/fbdev/hpfb.c
+++ b/drivers/video/fbdev/hpfb.c
@@ -184,7 +184,7 @@ static int hpfb_sync(struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops hpfb_ops = {
+static const struct fb_ops hpfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= hpfb_setcolreg,
 	.fb_blank	= hpfb_blank,
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 2dcb7c58b31e..fcd546e5c031 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -623,7 +623,7 @@ static void hvfb_cfb_imageblit(struct fb_info *p,
 		synthvid_update(p);
 }
 
-static struct fb_ops hvfb_ops = {
+static const struct fb_ops hvfb_ops = {
 	.owner = THIS_MODULE,
 	.fb_check_var = hvfb_check_var,
 	.fb_set_par = hvfb_set_par,
diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 347cf8babc3e..c65ec7386e87 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -981,7 +981,7 @@ static int i740fb_blank(int blank_mode, struct fb_info *info)
 	return (blank_mode == FB_BLANK_NORMAL) ? 1 : 0;
 }
 
-static struct fb_ops i740fb_ops = {
+static const struct fb_ops i740fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= i740fb_open,
 	.fb_release	= i740fb_release,
diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index 58b01c7d9056..3ac053b88495 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1333,7 +1333,7 @@ static struct pci_driver imsttfb_pci_driver = {
 	.remove =	imsttfb_remove,
 };
 
-static struct fb_ops imsttfb_ops = {
+static const struct fb_ops imsttfb_ops = {
 	.owner 		= THIS_MODULE,
 	.fb_check_var	= imsttfb_check_var,
 	.fb_set_par 	= imsttfb_set_par,
diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index b3286d1fa543..08a17eb2a5c7 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -566,7 +566,7 @@ static int imxfb_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops imxfb_ops = {
+static const struct fb_ops imxfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= imxfb_check_var,
 	.fb_set_par	= imxfb_set_par,
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index a76c61512c60..c744891781a5 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -193,7 +193,7 @@ static const struct pci_device_id intelfb_pci_table[] = {
 static int num_registered = 0;
 
 /* fb ops */
-static struct fb_ops intel_fb_ops = {
+static const struct fb_ops intel_fb_ops = {
 	.owner =		THIS_MODULE,
 	.fb_open =              intelfb_open,
 	.fb_release =           intelfb_release,
diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index a7bd9f25911b..72dff2e42e3a 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -648,7 +648,7 @@ static struct pci_driver kyrofb_pci_driver = {
 	.remove		= kyrofb_remove,
 };
 
-static struct fb_ops kyrofb_ops = {
+static const struct fb_ops kyrofb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= kyrofb_check_var,
 	.fb_set_par	= kyrofb_set_par,
diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
index 5b1141ac182b..40b11cce0ad6 100644
--- a/drivers/video/fbdev/leo.c
+++ b/drivers/video/fbdev/leo.c
@@ -39,7 +39,7 @@ static int leo_pan_display(struct fb_var_screeninfo *, struct fb_info *);
  *  Frame buffer operations
  */
 
-static struct fb_ops leo_ops = {
+static const struct fb_ops leo_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= leo_setcolreg,
 	.fb_blank		= leo_blank,
diff --git a/drivers/video/fbdev/macfb.c b/drivers/video/fbdev/macfb.c
index 9a6feee96133..e05a97662ca8 100644
--- a/drivers/video/fbdev/macfb.c
+++ b/drivers/video/fbdev/macfb.c
@@ -496,7 +496,7 @@ static int macfb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	return 0;
 }
 
-static struct fb_ops macfb_ops = {
+static const struct fb_ops macfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= macfb_setcolreg,
 	.fb_fillrect	= cfb_fillrect,
diff --git a/drivers/video/fbdev/matrox/matroxfb_crtc2.c b/drivers/video/fbdev/matrox/matroxfb_crtc2.c
index d2a81a2c3ac0..7655afa3fd50 100644
--- a/drivers/video/fbdev/matrox/matroxfb_crtc2.c
+++ b/drivers/video/fbdev/matrox/matroxfb_crtc2.c
@@ -563,7 +563,7 @@ static int matroxfb_dh_blank(int blank, struct fb_info* info) {
 #undef m2info
 }
 
-static struct fb_ops matroxfb_dh_ops = {
+static const struct fb_ops matroxfb_dh_ops = {
 	.owner =	THIS_MODULE,
 	.fb_open =	matroxfb_dh_open,
 	.fb_release =	matroxfb_dh_release,
diff --git a/drivers/video/fbdev/maxinefb.c b/drivers/video/fbdev/maxinefb.c
index 5bb1b5c308a7..ae1a42bcb0ea 100644
--- a/drivers/video/fbdev/maxinefb.c
+++ b/drivers/video/fbdev/maxinefb.c
@@ -105,7 +105,7 @@ static int maxinefb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	return 0;
 }
 
-static struct fb_ops maxinefb_ops = {
+static const struct fb_ops maxinefb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= maxinefb_setcolreg,
 	.fb_fillrect	= cfb_fillrect,
diff --git a/drivers/video/fbdev/mbx/mbxfb.c b/drivers/video/fbdev/mbx/mbxfb.c
index 50935252b50b..25dad4507d77 100644
--- a/drivers/video/fbdev/mbx/mbxfb.c
+++ b/drivers/video/fbdev/mbx/mbxfb.c
@@ -671,7 +671,7 @@ static int mbxfb_ioctl(struct fb_info *info, unsigned int cmd,
 	return -EINVAL;
 }
 
-static struct fb_ops mbxfb_ops = {
+static const struct fb_ops mbxfb_ops = {
 	.owner = THIS_MODULE,
 	.fb_check_var = mbxfb_check_var,
 	.fb_set_par = mbxfb_set_par,
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index bb4fee52e501..a42e2eceee48 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -558,7 +558,7 @@ static ssize_t metronomefb_write(struct fb_info *info, const char __user *buf,
 	return (err) ? err : count;
 }
 
-static struct fb_ops metronomefb_ops = {
+static const struct fb_ops metronomefb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_write	= metronomefb_write,
 	.fb_fillrect	= metronomefb_fillrect,
diff --git a/drivers/video/fbdev/mmp/fb/mmpfb.c b/drivers/video/fbdev/mmp/fb/mmpfb.c
index 47bc7c59bbd8..33db0850086f 100644
--- a/drivers/video/fbdev/mmp/fb/mmpfb.c
+++ b/drivers/video/fbdev/mmp/fb/mmpfb.c
@@ -454,7 +454,7 @@ static int mmpfb_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops mmpfb_ops = {
+static const struct fb_ops mmpfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_blank	= mmpfb_blank,
 	.fb_check_var	= mmpfb_check_var,
diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index bafd5f5fac5a..4af28e4421e5 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -1249,7 +1249,7 @@ static int mx3fb_pan_display(struct fb_var_screeninfo *var,
  * invoked by the core framebuffer driver to perform operations like
  * blitting, rectangle filling, copy regions and cursor definition.
  */
-static struct fb_ops mx3fb_ops = {
+static const struct fb_ops mx3fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_set_par = mx3fb_set_par,
 	.fb_check_var = mx3fb_check_var,
@@ -1389,7 +1389,8 @@ static int mx3fb_unmap_video_memory(struct fb_info *fbi)
  * mx3fb_init_fbinfo() - initialize framebuffer information object.
  * @return:	initialized framebuffer structure.
  */
-static struct fb_info *mx3fb_init_fbinfo(struct device *dev, struct fb_ops *ops)
+static struct fb_info *mx3fb_init_fbinfo(struct device *dev,
+					 const struct fb_ops *ops)
 {
 	struct fb_info *fbi;
 	struct mx3fb_info *mx3fbi;
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index b770946a0920..e6ea853c1723 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -1610,7 +1610,7 @@ neofb_cursor(struct fb_info *info, struct fb_cursor *cursor)
 }
 */
 
-static struct fb_ops neofb_ops = {
+static const struct fb_ops neofb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= neofb_open,
 	.fb_release	= neofb_release,
diff --git a/drivers/video/fbdev/ocfb.c b/drivers/video/fbdev/ocfb.c
index a970edc2a6f8..c8cee2d890dc 100644
--- a/drivers/video/fbdev/ocfb.c
+++ b/drivers/video/fbdev/ocfb.c
@@ -285,7 +285,7 @@ static int ocfb_init_var(struct ocfb_dev *fbdev)
 	return 0;
 }
 
-static struct fb_ops ocfb_ops = {
+static const struct fb_ops ocfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= ocfb_setcolreg,
 	.fb_fillrect	= cfb_fillrect,
diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index fbc6eafb63c7..5cd0f5f6a4ae 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -286,7 +286,7 @@ static void offb_destroy(struct fb_info *info)
 	framebuffer_release(info);
 }
 
-static struct fb_ops offb_ops = {
+static const struct fb_ops offb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_destroy	= offb_destroy,
 	.fb_setcolreg	= offb_setcolreg,
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index 858c2c011d19..8dfa9158ba78 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -1280,7 +1280,7 @@ ssize_t omapfb_write(struct fb_info *info, const char __user *buf,
 }
 #endif
 
-static struct fb_ops omapfb_ops = {
+static const struct fb_ops omapfb_ops = {
 	.owner          = THIS_MODULE,
 	.fb_open        = omapfb_open,
 	.fb_release     = omapfb_release,
diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
index 8c18cc51aae2..6da672e92643 100644
--- a/drivers/video/fbdev/p9100.c
+++ b/drivers/video/fbdev/p9100.c
@@ -37,7 +37,7 @@ static int p9100_ioctl(struct fb_info *, unsigned int, unsigned long);
  *  Frame buffer operations
  */
 
-static struct fb_ops p9100_ops = {
+static const struct fb_ops p9100_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= p9100_setcolreg,
 	.fb_blank		= p9100_blank,
diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/platinumfb.c
index 632b246ca35f..ce413a9df06e 100644
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -96,7 +96,7 @@ static int platinum_var_to_par(struct fb_var_screeninfo *var,
  * Interface used by the world
  */
 
-static struct fb_ops platinumfb_ops = {
+static const struct fb_ops platinumfb_ops = {
 	.owner =	THIS_MODULE,
 	.fb_check_var	= platinumfb_check_var,
 	.fb_set_par	= platinumfb_set_par,
diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 1dcf02e12af4..8f933bad461c 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -1483,7 +1483,7 @@ static int pm2fb_cursor(struct fb_info *info, struct fb_cursor *cursor)
  *  Frame buffer operations
  */
 
-static struct fb_ops pm2fb_ops = {
+static const struct fb_ops pm2fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= pm2fb_check_var,
 	.fb_set_par	= pm2fb_set_par,
diff --git a/drivers/video/fbdev/pm3fb.c b/drivers/video/fbdev/pm3fb.c
index 6130aa56a1e9..15a2b495235b 100644
--- a/drivers/video/fbdev/pm3fb.c
+++ b/drivers/video/fbdev/pm3fb.c
@@ -1200,7 +1200,7 @@ static int pm3fb_blank(int blank_mode, struct fb_info *info)
 	 *  Frame buffer operations
 	 */
 
-static struct fb_ops pm3fb_ops = {
+static const struct fb_ops pm3fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= pm3fb_check_var,
 	.fb_set_par	= pm3fb_set_par,
diff --git a/drivers/video/fbdev/pmag-aa-fb.c b/drivers/video/fbdev/pmag-aa-fb.c
index d1e78ce3a9c2..7b33b52b2526 100644
--- a/drivers/video/fbdev/pmag-aa-fb.c
+++ b/drivers/video/fbdev/pmag-aa-fb.c
@@ -147,7 +147,7 @@ static int aafb_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops aafb_ops = {
+static const struct fb_ops aafb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_blank	= aafb_blank,
 	.fb_fillrect	= cfb_fillrect,
diff --git a/drivers/video/fbdev/pmag-ba-fb.c b/drivers/video/fbdev/pmag-ba-fb.c
index 56b912bb28de..a60e56d8980b 100644
--- a/drivers/video/fbdev/pmag-ba-fb.c
+++ b/drivers/video/fbdev/pmag-ba-fb.c
@@ -117,7 +117,7 @@ static int pmagbafb_setcolreg(unsigned int regno, unsigned int red,
 	return 0;
 }
 
-static struct fb_ops pmagbafb_ops = {
+static const struct fb_ops pmagbafb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= pmagbafb_setcolreg,
 	.fb_fillrect	= cfb_fillrect,
diff --git a/drivers/video/fbdev/pmagb-b-fb.c b/drivers/video/fbdev/pmagb-b-fb.c
index 2822b2225924..f02080f21077 100644
--- a/drivers/video/fbdev/pmagb-b-fb.c
+++ b/drivers/video/fbdev/pmagb-b-fb.c
@@ -121,7 +121,7 @@ static int pmagbbfb_setcolreg(unsigned int regno, unsigned int red,
 	return 0;
 }
 
-static struct fb_ops pmagbbfb_ops = {
+static const struct fb_ops pmagbbfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= pmagbbfb_setcolreg,
 	.fb_fillrect	= cfb_fillrect,
diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index 5ed2db39d823..834f63edf700 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -934,7 +934,7 @@ static irqreturn_t ps3fb_vsync_interrupt(int irq, void *ptr)
 }
 
 
-static struct fb_ops ps3fb_ops = {
+static const struct fb_ops ps3fb_ops = {
 	.fb_open	= ps3fb_open,
 	.fb_release	= ps3fb_release,
 	.fb_read        = fb_sys_read,
diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 0a3b2b7c7891..fcb16eabbb0d 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -707,7 +707,7 @@ static ssize_t pvr2fb_write(struct fb_info *info, const char *buf,
 }
 #endif /* CONFIG_PVR2_DMA */
 
-static struct fb_ops pvr2fb_ops = {
+static const struct fb_ops pvr2fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= pvr2fb_setcolreg,
 	.fb_blank	= pvr2fb_blank,
diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index 1410f476e135..c672c3354a2c 100644
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -545,7 +545,7 @@ static irqreturn_t pxa168fb_handle_irq(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static struct fb_ops pxa168fb_ops = {
+static const struct fb_ops pxa168fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= pxa168fb_check_var,
 	.fb_set_par	= pxa168fb_set_par,
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index f70c9f79622e..6f7e9fb63190 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -597,7 +597,7 @@ static int pxafb_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops pxafb_ops = {
+static const struct fb_ops pxafb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= pxafb_check_var,
 	.fb_set_par	= pxafb_set_par,
@@ -865,7 +865,7 @@ static int overlayfb_set_par(struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops overlay_fb_ops = {
+static const struct fb_ops overlay_fb_ops = {
 	.owner			= THIS_MODULE,
 	.fb_open		= overlayfb_open,
 	.fb_release		= overlayfb_release,
diff --git a/drivers/video/fbdev/q40fb.c b/drivers/video/fbdev/q40fb.c
index 0b93aa964d43..79ff14a35c85 100644
--- a/drivers/video/fbdev/q40fb.c
+++ b/drivers/video/fbdev/q40fb.c
@@ -75,7 +75,7 @@ static int q40fb_setcolreg(unsigned regno, unsigned red, unsigned green,
     return 0;
 }
 
-static struct fb_ops q40fb_ops = {
+static const struct fb_ops q40fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= q40fb_setcolreg,
 	.fb_fillrect	= cfb_fillrect,
diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index ca593a3e41d7..764ec3285e62 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -1673,7 +1673,7 @@ static int rivafb_sync(struct fb_info *info)
  * ------------------------------------------------------------------------- */
 
 /* kernel interface */
-static struct fb_ops riva_fb_ops = {
+static const struct fb_ops riva_fb_ops = {
 	.owner 		= THIS_MODULE,
 	.fb_open	= rivafb_open,
 	.fb_release	= rivafb_release,
diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index ba04d7a67829..f4871c430f8d 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -1035,7 +1035,7 @@ static int s3c_fb_ioctl(struct fb_info *info, unsigned int cmd,
 	return ret;
 }
 
-static struct fb_ops s3c_fb_ops = {
+static const struct fb_ops s3c_fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= s3c_fb_check_var,
 	.fb_set_par	= s3c_fb_set_par,
diff --git a/drivers/video/fbdev/s3c2410fb.c b/drivers/video/fbdev/s3c2410fb.c
index a702da89910b..2fb15a540167 100644
--- a/drivers/video/fbdev/s3c2410fb.c
+++ b/drivers/video/fbdev/s3c2410fb.c
@@ -618,7 +618,7 @@ static int s3c2410fb_debug_store(struct device *dev,
 
 static DEVICE_ATTR(debug, 0664, s3c2410fb_debug_show, s3c2410fb_debug_store);
 
-static struct fb_ops s3c2410fb_ops = {
+static const struct fb_ops s3c2410fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= s3c2410fb_check_var,
 	.fb_set_par	= s3c2410fb_set_par,
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index be16c349c10f..60c424fae988 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -1037,7 +1037,7 @@ static int s3fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
 
 /* Frame buffer operations */
 
-static struct fb_ops s3fb_ops = {
+static const struct fb_ops s3fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= s3fb_open,
 	.fb_release	= s3fb_release,
diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index 81ad3aa1ca06..4680cc3efb81 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -574,7 +574,7 @@ static int sa1100fb_mmap(struct fb_info *info,
 	return vm_iomap_memory(vma, info->fix.mmio_start, info->fix.mmio_len);
 }
 
-static struct fb_ops sa1100fb_ops = {
+static const struct fb_ops sa1100fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= sa1100fb_check_var,
 	.fb_set_par	= sa1100fb_set_par,
diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index 512789f5f884..aab312a7d9da 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -1637,7 +1637,7 @@ static int savagefb_release(struct fb_info *info, int user)
 	return 0;
 }
 
-static struct fb_ops savagefb_ops = {
+static const struct fb_ops savagefb_ops = {
 	.owner          = THIS_MODULE,
 	.fb_open        = savagefb_open,
 	.fb_release     = savagefb_release,
diff --git a/drivers/video/fbdev/sh7760fb.c b/drivers/video/fbdev/sh7760fb.c
index ab8fe838c776..b8ec8d9bb4c8 100644
--- a/drivers/video/fbdev/sh7760fb.c
+++ b/drivers/video/fbdev/sh7760fb.c
@@ -341,7 +341,7 @@ static int sh7760fb_set_par(struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops sh7760fb_ops = {
+static const struct fb_ops sh7760fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_blank = sh7760fb_blank,
 	.fb_check_var = sh7760fb_check_var,
diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index c249763dbf0b..25f119efebc0 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1490,7 +1490,7 @@ sh_mobile_lcdc_overlay_mmap(struct fb_info *info, struct vm_area_struct *vma)
 				 ovl->dma_handle, ovl->fb_size);
 }
 
-static struct fb_ops sh_mobile_lcdc_overlay_ops = {
+static const struct fb_ops sh_mobile_lcdc_overlay_ops = {
 	.owner          = THIS_MODULE,
 	.fb_read        = fb_sys_read,
 	.fb_write       = fb_sys_write,
@@ -1964,7 +1964,7 @@ sh_mobile_lcdc_mmap(struct fb_info *info, struct vm_area_struct *vma)
 				 ch->dma_handle, ch->fb_size);
 }
 
-static struct fb_ops sh_mobile_lcdc_ops = {
+static const struct fb_ops sh_mobile_lcdc_ops = {
 	.owner          = THIS_MODULE,
 	.fb_setcolreg	= sh_mobile_lcdc_setcolreg,
 	.fb_read        = fb_sys_read,
diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 7dc0105f700d..533a047d07a2 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -78,7 +78,7 @@ static void simplefb_destroy(struct fb_info *info)
 		iounmap(info->screen_base);
 }
 
-static struct fb_ops simplefb_ops = {
+static const struct fb_ops simplefb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_destroy	= simplefb_destroy,
 	.fb_setcolreg	= simplefb_setcolreg,
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index b443a8ed4600..ac140962b1bf 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -1906,7 +1906,7 @@ sisfb_get_fix(struct fb_fix_screeninfo *fix, int con, struct fb_info *info)
 
 /* ----------------  fb_ops structures ----------------- */
 
-static struct fb_ops sisfb_ops = {
+static const struct fb_ops sisfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= sisfb_open,
 	.fb_release	= sisfb_release,
diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index 812a36cb60c3..bcacfb6934fa 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -634,7 +634,7 @@ int xxxfb_sync(struct fb_info *info)
      *  Frame buffer operations
      */
 
-static struct fb_ops xxxfb_ops = {
+static const struct fb_ops xxxfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= xxxfb_open,
 	.fb_read	= xxxfb_read,
diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index 207d0add684b..6a1b4a853d9e 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1369,7 +1369,7 @@ static int smtc_set_par(struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops smtcfb_ops = {
+static const struct fb_ops smtcfb_ops = {
 	.owner        = THIS_MODULE,
 	.fb_check_var = smtc_check_var,
 	.fb_set_par   = smtc_set_par,
diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index e362d7da87fc..bfac3ee4a642 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1268,7 +1268,7 @@ static int ufx_ops_blank(int blank_mode, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops ufx_ops = {
+static const struct fb_ops ufx_ops = {
 	.owner = THIS_MODULE,
 	.fb_read = fb_sys_read,
 	.fb_write = ufx_ops_write,
diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 78ca7ffc40c2..142535267fec 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -280,7 +280,7 @@ static void ssd1307fb_imageblit(struct fb_info *info, const struct fb_image *ima
 	ssd1307fb_update_display(par);
 }
 
-static struct fb_ops ssd1307fb_ops = {
+static const struct fb_ops ssd1307fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_read	= fb_sys_read,
 	.fb_write	= ssd1307fb_write,
diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index 4e22ae383c87..82e707a48e4e 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -1307,7 +1307,7 @@ static int sstfb_setup(char *options)
 }
 
 
-static struct fb_ops sstfb_ops = {
+static const struct fb_ops sstfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= sstfb_check_var,
 	.fb_set_par	= sstfb_set_par,
diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 9e88e3f594c2..5400ab79fbbd 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1101,7 +1101,7 @@ stifb_init_display(struct stifb_info *fb)
 
 /* ------------ Interfaces to hardware functions ------------ */
 
-static struct fb_ops stifb_ops = {
+static const struct fb_ops stifb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_setcolreg	= stifb_setcolreg,
 	.fb_blank	= stifb_blank,
diff --git a/drivers/video/fbdev/sunxvr1000.c b/drivers/video/fbdev/sunxvr1000.c
index 784c9bd5d502..15b079505a00 100644
--- a/drivers/video/fbdev/sunxvr1000.c
+++ b/drivers/video/fbdev/sunxvr1000.c
@@ -59,7 +59,7 @@ static int gfb_setcolreg(unsigned regno,
 	return 0;
 }
 
-static struct fb_ops gfb_ops = {
+static const struct fb_ops gfb_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= gfb_setcolreg,
 	.fb_fillrect		= cfb_fillrect,
diff --git a/drivers/video/fbdev/sunxvr2500.c b/drivers/video/fbdev/sunxvr2500.c
index 31683e5a8b79..1d3bacd9d5ac 100644
--- a/drivers/video/fbdev/sunxvr2500.c
+++ b/drivers/video/fbdev/sunxvr2500.c
@@ -63,7 +63,7 @@ static int s3d_setcolreg(unsigned regno,
 	return 0;
 }
 
-static struct fb_ops s3d_ops = {
+static const struct fb_ops s3d_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= s3d_setcolreg,
 	.fb_fillrect		= cfb_fillrect,
diff --git a/drivers/video/fbdev/sunxvr500.c b/drivers/video/fbdev/sunxvr500.c
index d392976126a6..9daf17b11106 100644
--- a/drivers/video/fbdev/sunxvr500.c
+++ b/drivers/video/fbdev/sunxvr500.c
@@ -186,7 +186,7 @@ static void e3d_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 	spin_unlock_irqrestore(&ep->lock, flags);
 }
 
-static struct fb_ops e3d_ops = {
+static const struct fb_ops e3d_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= e3d_setcolreg,
 	.fb_fillrect		= e3d_fillrect,
diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
index 7897f86fb23e..34b2e5b6e84a 100644
--- a/drivers/video/fbdev/tcx.c
+++ b/drivers/video/fbdev/tcx.c
@@ -40,7 +40,7 @@ static int tcx_pan_display(struct fb_var_screeninfo *, struct fb_info *);
  *  Frame buffer operations
  */
 
-static struct fb_ops tcx_ops = {
+static const struct fb_ops tcx_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= tcx_setcolreg,
 	.fb_blank		= tcx_blank,
diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index fdbb1ea66e6c..0349cf69652f 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1141,7 +1141,7 @@ static int tdfxfb_cursor(struct fb_info *info, struct fb_cursor *cursor)
 	return 0;
 }
 
-static struct fb_ops tdfxfb_ops = {
+static const struct fb_ops tdfxfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= tdfxfb_check_var,
 	.fb_set_par	= tdfxfb_set_par,
diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 286b2371c7dd..7cd262858241 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -70,7 +70,7 @@ static struct tc_driver tgafb_tc_driver;
  *  Frame buffer operations
  */
 
-static struct fb_ops tgafb_ops = {
+static const struct fb_ops tgafb_ops = {
 	.owner			= THIS_MODULE,
 	.fb_check_var		= tgafb_check_var,
 	.fb_set_par		= tgafb_set_par,
diff --git a/drivers/video/fbdev/tmiofb.c b/drivers/video/fbdev/tmiofb.c
index 4f2fcea10d2b..50111966c981 100644
--- a/drivers/video/fbdev/tmiofb.c
+++ b/drivers/video/fbdev/tmiofb.c
@@ -646,7 +646,7 @@ static int tmiofb_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops tmiofb_ops = {
+static const struct fb_ops tmiofb_ops = {
 	.owner		= THIS_MODULE,
 
 	.fb_ioctl	= tmiofb_ioctl,
diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index da74bf6c5996..715509917eaa 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -1443,7 +1443,7 @@ static int tridentfb_blank(int blank_mode, struct fb_info *info)
 	return (blank_mode == FB_BLANK_NORMAL) ? 1 : 0;
 }
 
-static struct fb_ops tridentfb_ops = {
+static const struct fb_ops tridentfb_ops = {
 	.owner = THIS_MODULE,
 	.fb_setcolreg = tridentfb_setcolreg,
 	.fb_pan_display = tridentfb_pan_display,
diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index e04fde9c1fcd..ca8d7343aaa1 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -113,7 +113,7 @@ static int valkyrie_init_info(struct fb_info *info, struct fb_info_valkyrie *p);
 static void valkyrie_par_to_fix(struct fb_par_valkyrie *par, struct fb_fix_screeninfo *fix);
 static void valkyrie_init_fix(struct fb_fix_screeninfo *fix, struct fb_info_valkyrie *p);
 
-static struct fb_ops valkyriefb_ops = {
+static const struct fb_ops valkyriefb_ops = {
 	.owner =	THIS_MODULE,
 	.fb_check_var =	valkyriefb_check_var,
 	.fb_set_par =	valkyriefb_set_par,
diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index 54127905bfe7..95d3c59867d0 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -78,7 +78,7 @@ static int vfb_pan_display(struct fb_var_screeninfo *var,
 static int vfb_mmap(struct fb_info *info,
 		    struct vm_area_struct *vma);
 
-static struct fb_ops vfb_ops = {
+static const struct fb_ops vfb_ops = {
 	.fb_read        = fb_sys_read,
 	.fb_write       = fb_sys_write,
 	.fb_check_var	= vfb_check_var,
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 2c6a576ed84c..a20eeb8308ff 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1270,7 +1270,7 @@ static void vga16fb_destroy(struct fb_info *info)
 	framebuffer_release(info);
 }
 
-static struct fb_ops vga16fb_ops = {
+static const struct fb_ops vga16fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open        = vga16fb_open,
 	.fb_release     = vga16fb_release,
diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
index be8d9702cbb2..f744479dc7df 100644
--- a/drivers/video/fbdev/vt8500lcdfb.c
+++ b/drivers/video/fbdev/vt8500lcdfb.c
@@ -238,7 +238,7 @@ static int vt8500lcd_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops vt8500lcd_ops = {
+static const struct fb_ops vt8500lcd_ops = {
 	.owner		= THIS_MODULE,
 	.fb_set_par	= vt8500lcd_set_par,
 	.fb_setcolreg	= vt8500lcd_setcolreg,
diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index c339a8fbad81..7b3eef1b893f 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -634,7 +634,7 @@ static int vt8623fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *i
 
 /* Frame buffer operations */
 
-static struct fb_ops vt8623fb_ops = {
+static const struct fb_ops vt8623fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= vt8623fb_open,
 	.fb_release	= vt8623fb_release,
diff --git a/drivers/video/fbdev/w100fb.c b/drivers/video/fbdev/w100fb.c
index 3be07807edcd..fe628ec20149 100644
--- a/drivers/video/fbdev/w100fb.c
+++ b/drivers/video/fbdev/w100fb.c
@@ -549,7 +549,7 @@ static int w100fb_set_par(struct fb_info *info)
 /*
  *  Frame buffer operations
  */
-static struct fb_ops w100fb_ops = {
+static const struct fb_ops w100fb_ops = {
 	.owner        = THIS_MODULE,
 	.fb_check_var = w100fb_check_var,
 	.fb_set_par   = w100fb_set_par,
diff --git a/drivers/video/fbdev/wm8505fb.c b/drivers/video/fbdev/wm8505fb.c
index 17c780315ca5..b656eff58c23 100644
--- a/drivers/video/fbdev/wm8505fb.c
+++ b/drivers/video/fbdev/wm8505fb.c
@@ -246,7 +246,7 @@ static int wm8505fb_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops wm8505fb_ops = {
+static const struct fb_ops wm8505fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_set_par	= wm8505fb_set_par,
 	.fb_setcolreg	= wm8505fb_setcolreg,
diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index a3d6b6db221b..00307b8693bf 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -328,7 +328,7 @@ static int xenfb_set_par(struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops xenfb_fb_ops = {
+static const struct fb_ops xenfb_fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_read	= fb_sys_read,
 	.fb_write	= xenfb_write,
diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index 8628829b470d..ca4ff658cad0 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -247,7 +247,7 @@ xilinx_fb_blank(int blank_mode, struct fb_info *fbi)
 	return 0; /* success */
 }
 
-static struct fb_ops xilinxfb_ops = {
+static const struct fb_ops xilinxfb_ops = {
 	.owner			= THIS_MODULE,
 	.fb_setcolreg		= xilinx_fb_setcolreg,
 	.fb_blank		= xilinx_fb_blank,
-- 
2.20.1

