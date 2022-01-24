Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7060E49971D
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jan 2022 22:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446843AbiAXVJa (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jan 2022 16:09:30 -0500
Received: from mout.gmx.net ([212.227.15.19]:34435 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1445756AbiAXVE4 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jan 2022 16:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1643058270;
        bh=G4QL4aRF1MIZztEgXPaOqrg33QacvRQuLCKWZMhO5hI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=TEgwu1OLI2EylIhcQM69+CtUiQiFGv3pDFIjVtOjStjzUzKSkv0NZkE5ddGyu+MOz
         XHq/JNR2/K7pwGB2l8njcnrvmmZfbttoFVUEb0lJmojoXzC9/gmFrNmiWkx53gD4vP
         XGlKk7p8V3hXlHNjNQGLh3b6G57PNDU+mERvUbdc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.165.96]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1m9BC70jgD-013Nn8; Mon, 24
 Jan 2022 22:04:30 +0100
From:   Helge Deller <deller@gmx.de>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sven Schnelle <svens@stackframe.org>,
        Claudio Suarez <cssk@net-c.es>, Pavel Machek <pavel@ucw.cz>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH v2 2/2] Revert "fbcon: Disable accelerated scrolling"
Date:   Mon, 24 Jan 2022 22:03:19 +0100
Message-Id: <20220124210319.325512-3-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220124210319.325512-1-deller@gmx.de>
References: <20220124210319.325512-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ySEdTqxyN4+8/eoyNl3Y5jBwuWgAI9+/uKXggaWUbafd2Gj8Wn/
 IH+av127DUXHEIAz14NtmoBigme8HMcEvzDSnsZWNHVaZtANmghk5OfvLDxqlB9qLtl7Ifv
 82qcSrQOsyCFjiK9GqlviB/sEebJcjzJ2SI7qlXkZdrdn2iGoMPzqrDV7HsDB4dJt9nzL6u
 EB6dF4Y06mni9T4L5dRaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YqCe6KqWbxw=:PmQ9dSxFAgk7w771AQmacv
 GYB06GZJ0jcz7TE8Jpg0XCskxty+kBcsIDg5vn8C6eI7v0Xt6UtfhUPoRaYJhQraXmd+wpBrA
 O+0K9QJy5raCVhoFIalXrvyX0Fg8eOpXhf9PbXNmCIyHylHekmp+aEycBE8NcFqbJwglpMrtV
 ILubnPRP2I07NisDerNbVsce9Tp1NbgFOZgNxb8jvPveX2W8NyYn2wfe7YnDPk8PqNVIfFxjt
 VgQzn/3f7NP8sD0wfEodbWD2yJ1w/UyErdreQh4ijjpdTsCnn+J+Z2egvuPu3+2QmJf96mfrN
 hV4WJ0zwYPJsQNxmRSw952vhwXCG4RVT2KERg5rJhdcEcxWsnqnJEg53ya9fpSRz/au9n2dGv
 +hVacxrBhgLiIDDNIrlrVheSlq/ERow276cdY8zteLiWY29gpznGQpCvj5TGxJwCxUbk4c2Fr
 nPbGXAyDT+qd9UKFuyL0b7kRa4NqhY+59r2mtSinmSSdy4GKafxUvbUELGQ9K626+ueDsvPKa
 sw9/HZoOSERuFTPaY6ExD+gTwcwnMphcBh2Ja9JlyWGGj+YDKCp36z5WenxzEGPzjl++JIkWz
 9ikZ9+Ca8K5IbUk26CHZHQvrXMD5X5+TLBLwrUdsFUvX6FOr5Aky6+RKOFoyGlldUL5onhmr9
 cqmKcT33apYh1A/fvZ7Rw0b4JmyvJ6ypuP/Nq4qm3p8iwVdp5FeiHFWWefOCpUyIOsGglbOUj
 dMYUan5ksP0yLJWdvzzcb9GabO4bs8LV47A/JP2SRlZ2DKFVbd0P5eO37xCNgwfhvlVH3Pj1k
 jmeAbSA7/FUw89I1XRhvf8XXk6JF2/QnLiT979q9Ceza3tUfiiyNiGg/TzCqJNMjEkw8b8LSN
 wHr12Y8t5TmVvBK4teNpg60o7Oz9xld2+5k/DIgTmT1DyDocUhzx48DxsU9yZmK574kRyaSk/
 3YjOx9/9nw/LpdHYj8VQ6CgczMokvjEcub4dHqV0GIOznU5FXV0K7V4OPC0W3Gsr3tZz6T8Je
 49l1xXtT0v7U1oXzGo31YkgXZM0ZPqKfxqYb46D/Jyoj+66OIjCg5e7Gc/3yzfkvxvI35RbQy
 tQMW0KWhiQSZR0=
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This reverts commit 39aead8373b3c20bb5965c024dfb51a94e526151.

Revert the first (of 2) commits which disabled scrolling acceleration in
fbcon/fbdev.  It introduced a regression for fbdev-supported graphic cards
because of the performance penalty by doing screen scrolling by software
instead of using the existing graphic card 2D hardware acceleration.

Console scrolling acceleration was disabled by dropping code which
checked at runtime the driver hardware capabilities for the
BINFO_HWACCEL_COPYAREA or FBINFO_HWACCEL_FILLRECT flags and if set, it
enabled scrollmode SCROLL_MOVE which uses hardware acceleration to move
screen contents.  After dropping those checks scrollmode was hard-wired
to SCROLL_REDRAW instead, which forces all graphic cards to redraw every
character at the new screen position when scrolling.

This change effectively disabled all hardware-based scrolling acceleration=
 for
ALL drivers, because now all kind of 2D hardware acceleration (bitblt,
fillrect) in the drivers isn't used any longer.

The original commit message mentions that only 3 DRM drivers (nouveau, oma=
pdrm
and gma500) used hardware acceleration in the past and thus code for check=
ing
and using scrolling acceleration is obsolete.

This statement is NOT TRUE, because beside the DRM drivers there are aroun=
d 35
other fbdev drivers which depend on fbdev/fbcon and still provide hardware
acceleration for fbdev/fbcon.

The original commit message also states that syzbot found lots of bugs in =
fbcon
and thus it's "often the solution to just delete code and remove features"=
.
This is true, and the bugs - which actually affected all users of fbcon,
including DRM - were fixed, or code was dropped like e.g. the support for
software scrollback in vgacon (commit 973c096f6a85).

So to further analyze which bugs were found by syzbot, I've looked through=
 all
patches in drivers/video which were tagged with syzbot or syzkaller back t=
o
year 2005. The vast majority fixed the reported issues on a higher level, =
e.g.
when screen is to be resized, or when font size is to be changed. The few =
ones
which touched driver code fixed a real driver bug, e.g. by adding a check.

But NONE of those patches touched code of either the SCROLL_MOVE or the
SCROLL_REDRAW case.

That means, there was no real reason why SCROLL_MOVE had to be ripped-out =
and
just SCROLL_REDRAW had to be used instead. The only reason I can imagine s=
o far
was that SCROLL_MOVE wasn't used by DRM and as such it was assumed that it
could go away. That argument completely missed the fact that SCROLL_MOVE i=
s
still heavily used by fbdev (non-DRM) drivers.

Some people mention that using memcpy() instead of the hardware accelerati=
on is
pretty much the same speed. But that's not true, at least not for older gr=
aphic
cards and machines where we see speed decreases by factor 10 and more and =
thus
this change leads to console responsiveness way worse than before.

That's why the original commit is to be reverted. By reverting we
reintroduce hardware-based scrolling acceleration and fix the
performance regression for fbdev drivers.

There isn't any impact on DRM when reverting those patches.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.10+
=2D--
 Documentation/gpu/todo.rst       | 21 ---------------
 drivers/video/fbdev/core/fbcon.c | 45 ++++++++++++++++++++++++++------
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 29506815d24a..a1212b5b3026 100644
=2D-- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -300,27 +300,6 @@ Contact: Daniel Vetter, Noralf Tronnes

 Level: Advanced

-Garbage collect fbdev scrolling acceleration
=2D--------------------------------------------
-
-Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =3D
-SCROLL_REDRAW. There's a ton of code this will allow us to remove:
-
=2D- lots of code in fbcon.c
-
=2D- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be=
 called
-  directly instead of the function table (with a switch on p->rotate)
-
=2D- fb_copyarea is unused after this, and can be deleted from all drivers
-
-Note that not all acceleration code can be deleted, since clearing and cu=
rsor
-support is still accelerated, which might be good candidates for further
-deletion projects.
-
-Contact: Daniel Vetter
-
-Level: Intermediate
-
 idr_init_base()
 ---------------

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index 22bb3892f6bd..b813985f1403 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1025,7 +1025,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 	struct vc_data *svc =3D *default_mode;
 	struct fbcon_display *t, *p =3D &fb_display[vc->vc_num];
 	int logo =3D 1, new_rows, new_cols, rows, cols;
-	int ret;
+	int cap, ret;

 	if (WARN_ON(info_idx =3D=3D -1))
 	    return;
@@ -1034,6 +1034,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 		con2fb_map[vc->vc_num] =3D info_idx;

 	info =3D registered_fb[con2fb_map[vc->vc_num]];
+	cap =3D info->flags;

 	if (logo_shown < 0 && console_loglevel <=3D CONSOLE_LOGLEVEL_QUIET)
 		logo_shown =3D FBCON_LOGO_DONTSHOW;
@@ -1135,13 +1136,11 @@ static void fbcon_init(struct vc_data *vc, int ini=
t)

 	ops->graphics =3D 0;

-	/*
-	 * No more hw acceleration for fbcon.
-	 *
-	 * FIXME: Garbage collect all the now dead code after sufficient time
-	 * has passed.
-	 */
-	p->scrollmode =3D SCROLL_REDRAW;
+	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
+	    !(cap & FBINFO_HWACCEL_DISABLED))
+		p->scrollmode =3D SCROLL_MOVE;
+	else /* default to something safe */
+		p->scrollmode =3D SCROLL_REDRAW;

 	/*
 	 *  ++guenther: console.c:vc_allocate() relies on initializing
@@ -1953,15 +1952,45 @@ static void updatescrollmode(struct fbcon_display =
*p,
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	int fh =3D vc->vc_font.height;
+	int cap =3D info->flags;
+	u16 t =3D 0;
+	int ypan =3D FBCON_SWAP(ops->rotate, info->fix.ypanstep,
+				  info->fix.xpanstep);
+	int ywrap =3D FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
 	int yres =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 	int vyres =3D FBCON_SWAP(ops->rotate, info->var.yres_virtual,
 				   info->var.xres_virtual);
+	int good_pan =3D (cap & FBINFO_HWACCEL_YPAN) &&
+		divides(ypan, vc->vc_font.height) && vyres > yres;
+	int good_wrap =3D (cap & FBINFO_HWACCEL_YWRAP) &&
+		divides(ywrap, vc->vc_font.height) &&
+		divides(vc->vc_font.height, vyres) &&
+		divides(vc->vc_font.height, yres);
+	int reading_fast =3D cap & FBINFO_READS_FAST;
+	int fast_copyarea =3D (cap & FBINFO_HWACCEL_COPYAREA) &&
+		!(cap & FBINFO_HWACCEL_DISABLED);
+	int fast_imageblit =3D (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
+		!(cap & FBINFO_HWACCEL_DISABLED);

 	p->vrows =3D vyres/fh;
 	if (yres > (fh * (vc->vc_rows + 1)))
 		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
 	if ((yres % fh) && (vyres % fh < yres % fh))
 		p->vrows--;
+
+	if (good_wrap || good_pan) {
+		if (reading_fast || fast_copyarea)
+			p->scrollmode =3D good_wrap ?
+				SCROLL_WRAP_MOVE : SCROLL_PAN_MOVE;
+		else
+			p->scrollmode =3D good_wrap ? SCROLL_REDRAW :
+				SCROLL_PAN_REDRAW;
+	} else {
+		if (reading_fast || (fast_copyarea && !fast_imageblit))
+			p->scrollmode =3D SCROLL_MOVE;
+		else
+			p->scrollmode =3D SCROLL_REDRAW;
+	}
 }

 #define PITCH(w) (((w) + 7) >> 3)
=2D-
2.31.1

