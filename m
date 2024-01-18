Return-Path: <linux-fbdev+bounces-615-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D241A83140A
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jan 2024 09:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7779928440F
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jan 2024 08:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A302E41A;
	Thu, 18 Jan 2024 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbURXVIx"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF5B2E632;
	Thu, 18 Jan 2024 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705564755; cv=none; b=ieqtRonyebjPl+6yDHavpt8XIiONsZLGM3wf09CTGLDoO43pZS4FQe/8l3tEMMqQJAkhw7G5EWt2xfhKoPHxw8jobeuRhIBUYArVvwxiU4P0PmR/0dpSjCdC5E1cHIqguV0sNlkRX8dspEj0ddX5jrN8WTSsAUxs0Yq0PnI6plY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705564755; c=relaxed/simple;
	bh=H6hFlY1FKBPnsfs08mbVDqLPJxxBmDB7umf0hERzFOM=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=iNz6q/aECeipHEO4EGUOoxnMbxxW8BtHs5cvtgfO/nnURCVIXBx1puVNSCVZRBrL/pMI0aHrFcGSMxv+TxIAxEz/52UkyXDE0Vzwq5LNEs2hpXdKHDPLgzysfUySa0mWc9vh29Hx2NQtljjTzKXpInenNeqMD3+fxNiea0AJcNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbURXVIx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8260EC433C7;
	Thu, 18 Jan 2024 07:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705564754;
	bh=H6hFlY1FKBPnsfs08mbVDqLPJxxBmDB7umf0hERzFOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PbURXVIxrpXhbi7nr/4F5QemRMJEqFVM6N1wnr1uHu69ybzThUUTF03tAqXd4boXc
	 JNlMC1DkV5FGrjRhDp3i2cslbC3OnW90bpr1vfZ2TZZsMXfO0uGg0vE4oocaCqg2Jn
	 47yHHjsRi3xjhVJKNYErMYNMB3OgQVJwoNrZIHPCqaUaaxUR73hyO/sA2wqEIxg8PO
	 QQoZf4TMvMGyrEXfWW7fleB5kOYe46iiss3W2oNZk3V3T5xraRZvFL+GAEu+ZhYpfk
	 r8HkpYc/+kMAQNXiD8Siqrq8CKu1nLjWUYpN7wG7yWq/aFKnLS+blbmINMoMnJN0z7
	 QHy8Ge5WZuNcQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH 33/45] tty: vt: make types around consw::con_blank() bool
Date: Thu, 18 Jan 2024 08:57:44 +0100
Message-ID: <20240118075756.10541-34-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118075756.10541-1-jirislaby@kernel.org>
References: <20240118075756.10541-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the mode_switch parameter and the return value (a redraw needed)
are true/false. So switch them to bool, so that users won't return
-Eerrors or anything else.

And document the hook.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/video/console/dummycon.c    | 12 ++++++------
 drivers/video/console/mdacon.c      |  8 ++++----
 drivers/video/console/newport_con.c |  7 ++++---
 drivers/video/console/sticon.c      |  9 +++++----
 drivers/video/console/vgacon.c      |  4 ++--
 drivers/video/fbdev/core/fbcon.c    |  6 +++---
 include/linux/console.h             |  7 +++++--
 7 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index d86c1d798690..139049368fdc 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -79,21 +79,21 @@ static void dummycon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 	raw_notifier_call_chain(&dummycon_output_nh, 0, NULL);
 }
 
-static int dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
-			  int mode_switch)
+static bool dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
+			   bool mode_switch)
 {
 	/* Redraw, so that we get putc(s) for output done while blanked */
-	return 1;
+	return true;
 }
 #else
 static void dummycon_putc(struct vc_data *vc, u16 c, unsigned int y,
 			  unsigned int x) { }
 static void dummycon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 			   unsigned int ypos, unsigned int xpos) { }
-static int dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
-			  int mode_switch)
+static bool dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
+			   bool mode_switch)
 {
-	return 0;
+	return false;
 }
 #endif
 
diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
index 63e3ce678aab..c0e1f4554a44 100644
--- a/drivers/video/console/mdacon.c
+++ b/drivers/video/console/mdacon.c
@@ -451,8 +451,8 @@ static bool mdacon_switch(struct vc_data *c)
 	return true;	/* redrawing needed */
 }
 
-static int mdacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
-			int mode_switch)
+static bool mdacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			 bool mode_switch)
 {
 	if (mda_type == TYPE_MDA) {
 		if (blank) 
@@ -460,14 +460,14 @@ static int mdacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
 				mda_convert_attr(c->vc_video_erase_char),
 				c->vc_screenbuf_size);
 		/* Tell console.c that it has to restore the screen itself */
-		return 1;
+		return true;
 	} else {
 		if (blank)
 			outb_p(0x00, mda_mode_port);	/* disable video */
 		else
 			outb_p(MDA_MODE_VIDEO_EN | MDA_MODE_BLINK_EN, 
 				mda_mode_port);
-		return 0;
+		return false;
 	}
 }
 
diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 38437a53b7f1..dbb31bf87bf1 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -476,8 +476,8 @@ static bool newport_switch(struct vc_data *vc)
 	return true;
 }
 
-static int newport_blank(struct vc_data *c, enum vesa_blank_mode blank,
-			 int mode_switch)
+static bool newport_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			  bool mode_switch)
 {
 	unsigned short treg;
 
@@ -492,7 +492,8 @@ static int newport_blank(struct vc_data *c, enum vesa_blank_mode blank,
 		newport_vc2_set(npregs, VC2_IREG_CONTROL,
 				(treg & ~(VC2_CTRL_EDISP)));
 	}
-	return 1;
+
+	return true;
 }
 
 static int newport_set_font(int unit, struct console_font *op, unsigned int vpitch)
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index e9d5d1f92883..cbb9ef438214 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -298,19 +298,20 @@ static bool sticon_switch(struct vc_data *conp)
     return true;	/* needs refreshing */
 }
 
-static int sticon_blank(struct vc_data *c, enum vesa_blank_mode blank,
-			int mode_switch)
+static bool sticon_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			 bool mode_switch)
 {
     if (blank == VESA_NO_BLANKING) {
 	if (mode_switch)
 	    vga_is_gfx = 0;
-	return 1;
+	return true;
     }
     sti_clear(sticon_sti, 0, 0, c->vc_rows, c->vc_cols, BLANK,
 	      font_data[c->vc_num]);
     if (mode_switch)
 	vga_is_gfx = 1;
-    return 1;
+
+    return true;
 }
 
 static u8 sticon_build_attr(struct vc_data *conp, u8 color,
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index a4bd97ab502d..1ef318bac703 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -797,8 +797,8 @@ static void vga_pal_blank(struct vgastate *state)
 	}
 }
 
-static int vgacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
-			int mode_switch)
+static bool vgacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			 bool mode_switch)
 {
 	switch (blank) {
 	case VESA_NO_BLANKING:		/* Unblank */
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 69be5f2106bc..eee2adf5c682 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2198,8 +2198,8 @@ static void fbcon_generic_blank(struct vc_data *vc, struct fb_info *info,
 	}
 }
 
-static int fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
-		       int mode_switch)
+static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
+			bool mode_switch)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
@@ -2238,7 +2238,7 @@ static int fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 	else
 		fbcon_add_cursor_work(info);
 
-	return 0;
+	return false;
 }
 
 static void fbcon_debug_enter(struct vc_data *vc)
diff --git a/include/linux/console.h b/include/linux/console.h
index 5ea984b8c5e4..fbb32e702472 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -57,6 +57,9 @@ enum vc_intensity;
  *		Invoked by csi_M and printing to the console.
  * @con_switch: notifier about the console switch; it is supposed to return
  *		true if a redraw is needed.
+ * @con_blank:  blank/unblank the console. The target mode is passed in @blank.
+ *		@mode_switch is set if changing from/to text/graphics. The hook
+ *		is supposed to return true if a redraw is needed.
  * @con_set_palette: sets the palette of the console to @table (optional)
  * @con_scrolldelta: the contents of the console should be scrolled by @lines.
  *		     Invoked by user. (optional)
@@ -78,8 +81,8 @@ struct consw {
 			unsigned int bottom, enum con_scroll dir,
 			unsigned int lines);
 	bool	(*con_switch)(struct vc_data *vc);
-	int	(*con_blank)(struct vc_data *vc, enum vesa_blank_mode blank,
-			     int mode_switch);
+	bool	(*con_blank)(struct vc_data *vc, enum vesa_blank_mode blank,
+			     bool mode_switch);
 	int	(*con_font_set)(struct vc_data *vc, struct console_font *font,
 			unsigned int vpitch, unsigned int flags);
 	int	(*con_font_get)(struct vc_data *vc, struct console_font *font,
-- 
2.43.0


