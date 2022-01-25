Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D14549BC70
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Jan 2022 20:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbiAYTqZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Jan 2022 14:46:25 -0500
Received: from mout.gmx.net ([212.227.15.15]:32847 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231440AbiAYToq (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Jan 2022 14:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1643139876;
        bh=jxB2aXFCQRGPGLkLR+gNBUOw0hJylbwRJ7yzEWwPIIQ=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=hK9Ir2jTXgin5gTPG9mB5b1E6671ESQdQzh0g/OjS+SpCAXl7/wukiZsfOgasqqOG
         2N7FX/S9EBu2tRmTL3THL7ofovdwEsd6KNOa9fJGdr62CUKARwdTsoCOVIirQosvx4
         xsbZJKLGszA+t52ODk+3ivuoAknMiuHefD2U8Qcg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.229]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ygz-1nFTc8468Z-00343x; Tue, 25
 Jan 2022 20:44:36 +0100
Message-ID: <c1ec52f6-796d-63f2-1419-c73f6554de16@gmx.de>
Date:   Tue, 25 Jan 2022 20:43:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] [RFC] fbcon: Add option to enable legacy hardware
 acceleration
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>
References: <YfBLiUMokw6tLq0O@p100>
 <06f83d81-5df2-916a-4ae1-5a6e12b96832@gmx.de>
In-Reply-To: <06f83d81-5df2-916a-4ae1-5a6e12b96832@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:502YIj26rDhJKvL8GvEYzvTCNE9/t1JZVuoqJkJXfPo+gwiiz7T
 wCBZpO1HbVmbT7BweajPGFM7SN8BPLkVAlnIqiU6L541EbEy4FaHshmCUjvTtgpqecgN7+X
 GbhG+PcKG+pOJZD7RnOlU8lSod526frkvNnZNJLs45zUAM+2PT2dAoldREsWo57D08x9om3
 tFsR1olY03EZwymwyZchg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qDAX4ca74PE=:X9Yu0R0GgD8Qqx29MldT4m
 vjt/7/N3oxWZ4NtXwYATJPwIXfBzjBWDf/+4rJkLODF039UO3K5bEQzl+UyIvuoN9Jw4p0bGT
 KbxrCXr3kkFpVn5S+26mNXAnlJH5ggfktdAc3ALkr7qqf2v1Thq2lj0sQ+tpK4ZsCjYI9uyF2
 IuyY/6bBsktVTlmQKSv+sSCXEkABDteRO2gN2w+6TPDRVTu4w/YvlZXzwOUIepZBHzraSeknA
 gUABW/+P1VS4FihWlWzOo/U1dAVV0zsu+jGjAuNQyTA965qhWDo7i5z9JjroaXxOWJUBbigaB
 o0WoZ99VB08ctZIXyANB+a0Zz9o79bIB5uAs1mm6eezKh6QoZsj+hmcWnYlK0B4BUKDOT3CAR
 Ka7+/XMfXtfHVSzghQLq4qk7XQljYtrYi5JnSLOSaKZbf3sljC6ZnOYSitG9wF+qfa/1jHKnw
 N1u39pQpsp+W5Md34MWYOiv+1LnmGoj645Sm+O/AymlZLKPL+FxNp0QLtEFJObnbKNeuIw/e4
 EKDhPwppEniMgEy1yBXnZ52FLPaVNj9BhdB8cHSZvn9GILo0xeAtbmDBKD+IFU46LsmcIrJLA
 oB2KCUMQo/tHHpylEy/L+rgfjkpOHVmt4Xal9X3SxuI5x2oFFSsnqtbHODN0L/LL6DFlZ5A7s
 hYZc6t/brVrC8+9en9GHENCKjGyGQ7Co+Ll4l++F58Su8SYt4DOGuj2sdCOvpEPxCSl6Kx7P0
 vh/XIjVnX5ykBj5bpn//m+HVDXZWee3MIKV+W9RF4KYrk3/pMY4ypB8yksawWQA3xpZYhmlHQ
 dzQvb8CEOODj0Ih5BPU7UqjzBiC8T8L+HVGAtnITNpf1gFnjNv8zePIfyD2+X/KZHtdeSXCgG
 wX35EVVn3M8unY1ncm8Pn3f9gpvrAMQ/TOwoSbSa3rZE+xrxB5kUOD07fgH3zHkkTIbSBqKFl
 6hKv7gcekiJrEJNx7RLue7+O512z0me/e0U9Db0jU3uBTCC66zwdr2TX07VZnzXZCOxpI840d
 s8NAP4xUi1Zh3yMjK76Tj2A9aKI7ZaQpsi6PyGlcSpPhakNCMBkpoG+tqWcLEho5QbjbjCroW
 qm1mpUno8HD0HY=
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 1/25/22 20:17, Helge Deller wrote:
> On 1/25/22 20:12, Helge Deller wrote:
>> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
>> enable bitblt and fillrect hardware acceleration in the framebuffer
>> console. If disabled, such acceleration will not be used, even if it is
>> supported by the graphics hardware driver.
>>
>> If you plan to use DRM as your main graphics output system, you should
>> disable this option since it will prevent compiling in code which isn't
>> used later on when DRM takes over.
>>
>> For all other configurations, e.g. if none of your graphic cards suppor=
t
>> DRM (yet), DRM isn't available for your architecture, or you can't be
>> sure that the graphic card in the target system will support DRM, you
>> most likely want to enable this option.
>>
>>
>> This patch is the first RFC.
>
> I forgot to mention that by using the static fb_scrollmode() function
> I expect the compiler to optimize-out all code which seems problematic
> from DRM's POV...

This patch is not complete, for example there are more changes necessary
in fbcon_cw.c, bcon_ccw.c and fbcon_ccw.c.

Anyway, for the first round I'm interested in general feedback, if this is
the direction which is acceptable for you.

In addition I think fb_scrollmode() should be renamed to fbcon_scrollmode(=
)
to make it clear that it's a fbcon-related function.

If you want to test this patch you will need to first apply the revert-pat=
ches
I sent earlier.
Alternatively for testing it's possible to pull from the "fbcon-accel" bra=
nch from:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git  fb=
con-accel

Helge



>> Independed of this patch I did some timing experiments with a qemu
>> virtual machine running a PA-RISC Debian Linux installation with a
>> screen resolution of 2048x1024 with 8bpp. In that case qemu emulated th=
e
>> graphics hardware bitblt and fillrect acceleration by using the native
>> (x86) CPU.
>>
>> It was a simple testcase which was to run "time dmesg", where the syslo=
g
>> had 284 lines. The results showed a huge speedup:
>> a) time dmesg (without acceleration):
>>    -> 19.0 seconds
>> b) time dmesg (with acceleration):
>>    ->  2.6 seconds
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kcon=
fig
>> index 840d9813b0bc..da84d1c21c21 100644
>> --- a/drivers/video/console/Kconfig
>> +++ b/drivers/video/console/Kconfig
>> @@ -78,6 +78,17 @@ config FRAMEBUFFER_CONSOLE
>>  	help
>>  	  Low-level framebuffer-based console driver.
>>
>> +config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>> +	bool "Framebuffer Console hardware acceleration support"
>> +	depends on FRAMEBUFFER_CONSOLE
>> +	default y if !DRM
>> +	default y if !(X86 || ARM)
>> +	help
>> +	  If you use a system on which DRM is fully supported you usually wan=
t to say N,
>> +	  otherwise you probably want to enable this option.
>> +	  If enabled the framebuffer console will utilize the hardware accele=
ration
>> +	  of your graphics card by using hardware bitblt and fillrect feature=
s.
>> +
>>  config FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
>>         bool "Map the console to the primary display device"
>>         depends on FRAMEBUFFER_CONSOLE
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
>> index b813985f1403..f7b7d35953e8 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -1136,11 +1136,13 @@ static void fbcon_init(struct vc_data *vc, int =
init)
>>
>>  	ops->graphics =3D 0;
>>
>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>>  	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
>>  	    !(cap & FBINFO_HWACCEL_DISABLED))
>>  		p->scrollmode =3D SCROLL_MOVE;
>>  	else /* default to something safe */
>>  		p->scrollmode =3D SCROLL_REDRAW;
>> +#endif
>>
>>  	/*
>>  	 *  ++guenther: console.c:vc_allocate() relies on initializing
>> @@ -1705,7 +1707,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsi=
gned int t, unsigned int b,
>>  			count =3D vc->vc_rows;
>>  		if (logo_shown >=3D 0)
>>  			goto redraw_up;
>> -		switch (p->scrollmode) {
>> +		switch (fb_scrollmode(p)) {
>>  		case SCROLL_MOVE:
>>  			fbcon_redraw_blit(vc, info, p, t, b - t - count,
>>  				     count);
>> @@ -1795,7 +1797,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsi=
gned int t, unsigned int b,
>>  			count =3D vc->vc_rows;
>>  		if (logo_shown >=3D 0)
>>  			goto redraw_down;
>> -		switch (p->scrollmode) {
>> +		switch (fb_scrollmode(p)) {
>>  		case SCROLL_MOVE:
>>  			fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
>>  				     -count);
>> @@ -1946,12 +1948,12 @@ static void fbcon_bmove_rec(struct vc_data *vc,=
 struct fbcon_display *p, int sy,
>>  		   height, width);
>>  }
>>
>> -static void updatescrollmode(struct fbcon_display *p,
>> +static void updatescrollmode_accel(struct fbcon_display *p,
>>  					struct fb_info *info,
>>  					struct vc_data *vc)
>>  {
>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>>  	struct fbcon_ops *ops =3D info->fbcon_par;
>> -	int fh =3D vc->vc_font.height;
>>  	int cap =3D info->flags;
>>  	u16 t =3D 0;
>>  	int ypan =3D FBCON_SWAP(ops->rotate, info->fix.ypanstep,
>> @@ -1972,12 +1974,6 @@ static void updatescrollmode(struct fbcon_displa=
y *p,
>>  	int fast_imageblit =3D (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
>>  		!(cap & FBINFO_HWACCEL_DISABLED);
>>
>> -	p->vrows =3D vyres/fh;
>> -	if (yres > (fh * (vc->vc_rows + 1)))
>> -		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
>> -	if ((yres % fh) && (vyres % fh < yres % fh))
>> -		p->vrows--;
>> -
>>  	if (good_wrap || good_pan) {
>>  		if (reading_fast || fast_copyarea)
>>  			p->scrollmode =3D good_wrap ?
>> @@ -1991,6 +1987,27 @@ static void updatescrollmode(struct fbcon_displa=
y *p,
>>  		else
>>  			p->scrollmode =3D SCROLL_REDRAW;
>>  	}
>> +#endif
>> +}
>> +
>> +static void updatescrollmode(struct fbcon_display *p,
>> +					struct fb_info *info,
>> +					struct vc_data *vc)
>> +{
>> +	struct fbcon_ops *ops =3D info->fbcon_par;
>> +	int fh =3D vc->vc_font.height;
>> +	int yres =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>> +	int vyres =3D FBCON_SWAP(ops->rotate, info->var.yres_virtual,
>> +				   info->var.xres_virtual);
>> +
>> +	p->vrows =3D vyres/fh;
>> +	if (yres > (fh * (vc->vc_rows + 1)))
>> +		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
>> +	if ((yres % fh) && (vyres % fh < yres % fh))
>> +		p->vrows--;
>> +
>> +	/* update scrollmode in case hardware acceleration is used */
>> +	updatescrollmode_accel(p, info, vc);
>>  }
>>
>>  #define PITCH(w) (((w) + 7) >> 3)
>> @@ -2148,7 +2165,7 @@ static int fbcon_switch(struct vc_data *vc)
>>
>>  	updatescrollmode(p, info, vc);
>>
>> -	switch (p->scrollmode) {
>> +	switch (fb_scrollmode(p)) {
>>  	case SCROLL_WRAP_MOVE:
>>  		scrollback_phys_max =3D p->vrows - vc->vc_rows;
>>  		break;
>> diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/cor=
e/fbcon.h
>> index 9315b360c898..c5c043f38162 100644
>> --- a/drivers/video/fbdev/core/fbcon.h
>> +++ b/drivers/video/fbdev/core/fbcon.h
>> @@ -29,7 +29,9 @@ struct fbcon_display {
>>      /* Filled in by the low-level console driver */
>>      const u_char *fontdata;
>>      int userfont;                   /* !=3D 0 if fontdata kmalloc()ed =
*/
>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>>      u_short scrollmode;             /* Scroll Method */
>> +#endif
>>      u_short inverse;                /* !=3D 0 text black on white as d=
efault */
>>      short yscroll;                  /* Hardware scrolling */
>>      int vrows;                      /* number of virtual rows */
>> @@ -208,6 +210,17 @@ static inline int attr_col_ec(int shift, struct vc=
_data *vc,
>>  #define SCROLL_REDRAW	   0x004
>>  #define SCROLL_PAN_REDRAW  0x005
>>
>> +static inline u_short fb_scrollmode(struct fbcon_display *fb)
>> +{
>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>> +	return fb->scrollmode;
>> +#else
>> +	/* hardcoded to SCROLL_REDRAW if acceleration was disabled. */
>> +	return SCROLL_REDRAW;
>> +#endif
>> +}
>> +
>> +
>>  #ifdef CONFIG_FB_TILEBLITTING
>>  extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info=
);
>>  #endif
>>
>

