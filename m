Return-Path: <linux-fbdev+bounces-601-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE658313B0
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jan 2024 09:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C8F4B24500
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jan 2024 07:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCB611729;
	Thu, 18 Jan 2024 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTbag7YB"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057BE20B02;
	Thu, 18 Jan 2024 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705564697; cv=none; b=Ids3QFz++Ss2nJGN5JqGLVwLpytz5KHn/mOX/vyVGpO5YnnzQ/WubRXrRiPOFFevmFEIRvBvGBJS7YklZgcqwKZtUe/4d1tmIOah/EjH+f9jEgWoRpyEbn4OJYDI55ZCdZ/CTwzgtHlgOXuvxTJWhHqlnbhX6GlVmxJzsCPSy2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705564697; c=relaxed/simple;
	bh=mbeOO3/wQG7zrKVPovwISN/Vz9cG62FT4cGebtEkkis=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=U61vyv2Aqj+aTYf+BY1SCLLWVEX3/7eg8AUWlBGcQkeO/HkuIOnMHl6srVirUI2USzjiKXn67iSEcsMpnOZfSU90qwWegCZNMxzo3aIjnHKtVBRWRFW+sk2xKXpUgoydgraDxUBgBAJW8CjZeXxkMJ+sYQL22MtUaBfFoEgZsh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTbag7YB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE636C433C7;
	Thu, 18 Jan 2024 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705564696;
	bh=mbeOO3/wQG7zrKVPovwISN/Vz9cG62FT4cGebtEkkis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XTbag7YBqGjCwTW+176Jq0TjK2obwi+nI5fQdEK4uTeXw/EBow9TOHTV328C6pw7t
	 NRKY7iM9ZWOOJyLAXbWW0IAvW6TIr7NBNQb8i4cc0oyy7WnfeY+RxhcAheZGGC0hpJ
	 iZJOPB6z4FB/Eu5268MRDhy2vbSWuvNfgmHKFbQAGc/E6yMabr+aPlYr8oOFNuD8qb
	 ZLs3bpPvyNM/kI2+lPLJXYy7zuhkH3UUM9xZpGv6lh82w82P8QdwSp7SFCpkLC0DPs
	 ocbK4QBlXC84NNO2aw4dY56XYSCGp+dlTH6Ag2G9IMnzjdSSloJiGO08WktGxtp1MB
	 Hrzw5bvMFa76Q==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/45] tty: vt: pass vc_resize_user as a parameter
Date: Thu, 18 Jan 2024 08:57:18 +0100
Message-ID: <20240118075756.10541-8-jirislaby@kernel.org>
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

It is pretty unfortunate to set vc_data::vc_resize_user in two callers
of vc_do_resize(). vc_resize_user is immediately reset there (while
remembering it). So instead of this back and forth, pass 'from_user' as
a parameter.

Notes on 'int user':
* The name changes from 'user' to 'from_user' on some places to be
  consistent.
* The type is bool now as 'int user' might evoke user's uid or whatever.

Provided vc_resize() is called on many places and they need not to care
about this parameter, its prototype is kept unchanged. Instead, it is
now an inline calling a new __vc_resize() which implements the above.

This patch makes the situation much more obvious.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/tty/vt/vt.c              | 28 +++++++++++++---------------
 drivers/tty/vt/vt_ioctl.c        |  6 ++----
 drivers/video/console/vgacon.c   |  4 ++--
 drivers/video/fbdev/core/fbcon.c |  2 +-
 include/linux/console.h          |  2 +-
 include/linux/console_struct.h   |  1 -
 include/linux/vt_kern.h          |  9 ++++++++-
 7 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 3a6f60ad2224..c87837306074 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1115,13 +1115,13 @@ int vc_allocate(unsigned int currcons)	/* return 0 on success */
 }
 
 static inline int resize_screen(struct vc_data *vc, int width, int height,
-				int user)
+				bool from_user)
 {
 	/* Resizes the resolution of the display adapater */
 	int err = 0;
 
 	if (vc->vc_sw->con_resize)
-		err = vc->vc_sw->con_resize(vc, width, height, user);
+		err = vc->vc_sw->con_resize(vc, width, height, from_user);
 
 	return err;
 }
@@ -1132,6 +1132,7 @@ static inline int resize_screen(struct vc_data *vc, int width, int height,
  *	@vc: virtual console private data
  *	@cols: columns
  *	@lines: lines
+ *	@from_user: invoked by a user?
  *
  *	Resize a virtual console, clipping according to the actual constraints.
  *	If the caller passes a tty structure then update the termios winsize
@@ -1142,21 +1143,17 @@ static inline int resize_screen(struct vc_data *vc, int width, int height,
  */
 
 static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
-				unsigned int cols, unsigned int lines)
+			unsigned int cols, unsigned int lines, bool from_user)
 {
 	unsigned long old_origin, new_origin, new_scr_end, rlth, rrem, err = 0;
 	unsigned long end;
 	unsigned int old_rows, old_row_size, first_copied_row;
 	unsigned int new_cols, new_rows, new_row_size, new_screen_size;
-	unsigned int user;
 	unsigned short *oldscreen, *newscreen;
 	u32 **new_uniscr = NULL;
 
 	WARN_CONSOLE_UNLOCKED();
 
-	user = vc->vc_resize_user;
-	vc->vc_resize_user = 0;
-
 	if (cols > VC_MAXCOL || lines > VC_MAXROW)
 		return -EINVAL;
 
@@ -1182,7 +1179,7 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 		 * to deal with possible errors from the code below, we call
 		 * the resize_screen here as well.
 		 */
-		return resize_screen(vc, new_cols, new_rows, user);
+		return resize_screen(vc, new_cols, new_rows, from_user);
 	}
 
 	if (new_screen_size > KMALLOC_MAX_SIZE || !new_screen_size)
@@ -1205,7 +1202,7 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 	old_rows = vc->vc_rows;
 	old_row_size = vc->vc_size_row;
 
-	err = resize_screen(vc, new_cols, new_rows, user);
+	err = resize_screen(vc, new_cols, new_rows, from_user);
 	if (err) {
 		kfree(newscreen);
 		vc_uniscr_free(new_uniscr);
@@ -1292,22 +1289,23 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 }
 
 /**
- *	vc_resize		-	resize a VT
+ *	__vc_resize		-	resize a VT
  *	@vc: virtual console
  *	@cols: columns
  *	@rows: rows
+ *	@from_user: invoked by a user?
  *
  *	Resize a virtual console as seen from the console end of things. We
  *	use the common vc_do_resize methods to update the structures. The
  *	caller must hold the console sem to protect console internals and
  *	vc->port.tty
  */
-
-int vc_resize(struct vc_data *vc, unsigned int cols, unsigned int rows)
+int __vc_resize(struct vc_data *vc, unsigned int cols, unsigned int rows,
+		bool from_user)
 {
-	return vc_do_resize(vc->port.tty, vc, cols, rows);
+	return vc_do_resize(vc->port.tty, vc, cols, rows, from_user);
 }
-EXPORT_SYMBOL(vc_resize);
+EXPORT_SYMBOL(__vc_resize);
 
 /**
  *	vt_resize		-	resize a VT
@@ -1327,7 +1325,7 @@ static int vt_resize(struct tty_struct *tty, struct winsize *ws)
 	int ret;
 
 	console_lock();
-	ret = vc_do_resize(tty, vc, ws->ws_col, ws->ws_row);
+	ret = vc_do_resize(tty, vc, ws->ws_col, ws->ws_row, false);
 	console_unlock();
 	return ret;
 }
diff --git a/drivers/tty/vt/vt_ioctl.c b/drivers/tty/vt/vt_ioctl.c
index 8c685b501404..4b91072f3a4e 100644
--- a/drivers/tty/vt/vt_ioctl.c
+++ b/drivers/tty/vt/vt_ioctl.c
@@ -714,8 +714,7 @@ static int vt_resizex(struct vc_data *vc, struct vt_consize __user *cs)
 				vcp->vc_scan_lines = v.v_vlin;
 			if (v.v_clin)
 				vcp->vc_cell_height = v.v_clin;
-			vcp->vc_resize_user = 1;
-			ret = vc_resize(vcp, v.v_cols, v.v_rows);
+			ret = __vc_resize(vcp, v.v_cols, v.v_rows, true);
 			if (ret) {
 				vcp->vc_scan_lines = save_scan_lines;
 				vcp->vc_cell_height = save_cell_height;
@@ -923,9 +922,8 @@ int vt_ioctl(struct tty_struct *tty,
 			vc = vc_cons[i].d;
 
 			if (vc) {
-				vc->vc_resize_user = 1;
 				/* FIXME: review v tty lock */
-				vc_resize(vc_cons[i].d, cc, ll);
+				__vc_resize(vc_cons[i].d, cc, ll, true);
 			}
 		}
 		console_unlock();
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 9176fff9ce6e..0c76e2817b49 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -1081,12 +1081,12 @@ static int vgacon_font_get(struct vc_data *c, struct console_font *font, unsigne
 }
 
 static int vgacon_resize(struct vc_data *c, unsigned int width,
-			 unsigned int height, unsigned int user)
+			 unsigned int height, bool from_user)
 {
 	if ((width << 1) * height > vga_vram_size)
 		return -EINVAL;
 
-	if (user) {
+	if (from_user) {
 		/*
 		 * Ho ho!  Someone (svgatextmode, eh?) may have reprogrammed
 		 * the video mode!  Set the new defaults then and go away.
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index a8c32cb4c878..dd2f4617485c 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1996,7 +1996,7 @@ static void updatescrollmode(struct fbcon_display *p,
 #define CALC_FONTSZ(h, p, c) ((h) * (p) * (c)) /* size = height * pitch * charcount */
 
 static int fbcon_resize(struct vc_data *vc, unsigned int width,
-			unsigned int height, unsigned int user)
+			unsigned int height, bool from_user)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
diff --git a/include/linux/console.h b/include/linux/console.h
index 779d388af8a0..38b379d6c624 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -66,7 +66,7 @@ struct consw {
 	int	(*con_font_default)(struct vc_data *vc,
 			struct console_font *font, char *name);
 	int     (*con_resize)(struct vc_data *vc, unsigned int width,
-			unsigned int height, unsigned int user);
+			      unsigned int height, bool from_user);
 	void	(*con_set_palette)(struct vc_data *vc,
 			const unsigned char *table);
 	void	(*con_scrolldelta)(struct vc_data *vc, int lines);
diff --git a/include/linux/console_struct.h b/include/linux/console_struct.h
index 539f1cd45309..20f564e98552 100644
--- a/include/linux/console_struct.h
+++ b/include/linux/console_struct.h
@@ -151,7 +151,6 @@ struct vc_data {
 	DECLARE_BITMAP(vc_tab_stop, VC_TABSTOPS_COUNT);	/* Tab stops. 256 columns. */
 	unsigned char   vc_palette[16*3];       /* Colour palette for VGA+ */
 	unsigned short * vc_translate;
-	unsigned int    vc_resize_user;         /* resize request from user */
 	unsigned int	vc_bell_pitch;		/* Console bell pitch */
 	unsigned int	vc_bell_duration;	/* Console bell duration */
 	unsigned short	vc_cur_blink_ms;	/* Cursor blink duration */
diff --git a/include/linux/vt_kern.h b/include/linux/vt_kern.h
index a789ea3ed2a0..d008c3d0a9bb 100644
--- a/include/linux/vt_kern.h
+++ b/include/linux/vt_kern.h
@@ -25,7 +25,8 @@ extern int fg_console, last_console, want_console;
 
 int vc_allocate(unsigned int console);
 int vc_cons_allocated(unsigned int console);
-int vc_resize(struct vc_data *vc, unsigned int cols, unsigned int lines);
+int __vc_resize(struct vc_data *vc, unsigned int cols, unsigned int lines,
+		bool from_user);
 struct vc_data *vc_deallocate(unsigned int console);
 void reset_palette(struct vc_data *vc);
 void do_blank_screen(int entering_gfx);
@@ -42,6 +43,12 @@ void redraw_screen(struct vc_data *vc, int is_switch);
 #define update_screen(x) redraw_screen(x, 0)
 #define switch_screen(x) redraw_screen(x, 1)
 
+static inline int vc_resize(struct vc_data *vc, unsigned int cols,
+			    unsigned int lines)
+{
+	return __vc_resize(vc, cols, lines, false);
+}
+
 struct tty_struct;
 int tioclinux(struct tty_struct *tty, unsigned long arg);
 
-- 
2.43.0


