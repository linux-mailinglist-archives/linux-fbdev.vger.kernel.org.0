Return-Path: <linux-fbdev+bounces-678-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C5836083
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jan 2024 12:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 223611F248A5
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jan 2024 11:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DFD3BB38;
	Mon, 22 Jan 2024 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpdbXEtl"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF8C3CF48;
	Mon, 22 Jan 2024 11:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921461; cv=none; b=iGKrDLj5BM6RxhHg5B7XOfv0YudLMojLv4iNkWMh40ugxM686S9NA/5NibzTnsylrkBPC6ouil4gAHcqUOdn5okAigH4r4wGBsm0W+QPWUAQIxSK2EenyrneKdv5IEqYpFT+SMTHre6u8pVFOayDXs3pkpGejFW9NIu8FrFHXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921461; c=relaxed/simple;
	bh=mbeOO3/wQG7zrKVPovwISN/Vz9cG62FT4cGebtEkkis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYftpxIWZuZR0ZkYoRFXbKh6VKmEr5mv6mLJN18p8WgwGbOjQ2ADOWofRNxFGMA6APQKACkRlQCLWkUezPCSvS1BvmGbbUgdcyFNt1BsFkFUNCIqL4mZax+a4SFxBipWQVxYvGLH1m9Vovj+lA+yqIu0bzfErUcjHcjkhs5n50o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpdbXEtl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A59C43399;
	Mon, 22 Jan 2024 11:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705921460;
	bh=mbeOO3/wQG7zrKVPovwISN/Vz9cG62FT4cGebtEkkis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PpdbXEtl8n7MsvqZSen0IUKoUk5/YbYeywSlobrQMYBlLfswcJ8C/lwwMMEkr1Fki
	 TUO2HRPb5DpSpU1l+6Cr9EmhiX1oT3OKihNa8ZANPnWLOK7e1oXE47wbV2owMjKHab
	 88VYaxvaydu3VkNVf1R1d5wfxw8/LaJ74nhBHqVdxg3rhCSL1D2gElnyYmgF7anbHa
	 hJN/3L3/OQbJDMIMILb0OQKrWkzrjzGsHYV/eZ2cIOxYmEFuW7Q1TcgPeIgOlwgLsj
	 G6wHrt/NBTOKOR+FAsh/W+9aO/X6nGm0dnHemB+dasSDKA1/MruAkxoeyE2roWFAll
	 jbQ4U1E2bbAuQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/47] tty: vt: pass vc_resize_user as a parameter
Date: Mon, 22 Jan 2024 12:03:21 +0100
Message-ID: <20240122110401.7289-8-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122110401.7289-1-jirislaby@kernel.org>
References: <20240122110401.7289-1-jirislaby@kernel.org>
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


