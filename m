Return-Path: <linux-fbdev+bounces-479-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F15558251FE
	for <lists+linux-fbdev@lfdr.de>; Fri,  5 Jan 2024 11:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D71D71F23EB1
	for <lists+linux-fbdev@lfdr.de>; Fri,  5 Jan 2024 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B5424A13;
	Fri,  5 Jan 2024 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=libmpq.org header.i=@libmpq.org header.b="vy5qRY52"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail.libmpq.org (mail.libmpq.org [141.144.238.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88F828DAF
	for <linux-fbdev@vger.kernel.org>; Fri,  5 Jan 2024 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=libmpq.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=libmpq.org
Received: from libmpq.org (bart.theraso.int [172.16.50.100])
	by mail.libmpq.org (Postfix) with ESMTPSA id 52586B6;
	Fri,  5 Jan 2024 11:19:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=libmpq.org;
	s=libmpq.org; t=1704449980;
	bh=jMay5k7PAnBiJeThnuxUcCsebI1yXwTu4P5p9H8c9QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vy5qRY52KxQxdjsVRqiiF8pTvHC8g6XhnSRcUKtXqAEJPd0ZDLSnWPi5N5/LA11Vr
	 vaRzxPVbMwd+KSbkOAZrxh+e1vkpe1sqCTjT9++SSc4caGGKZoEN47MtjQCNji12CL
	 XYAh6bJsHbaOo+IMdOMo18MMMj730MISwn8RPXvI=
Date: Fri, 5 Jan 2024 11:20:10 +0100
From: Maik Broemme <mbroemme@libmpq.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev/intelfb: Remove driver
Message-ID: <ZZfX2s4GZb_Sf9Ag@libmpq.org>
References: <20240105091127.23087-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240105091127.23087-1-tzimmermann@suse.de>
Priority: normal
X-Operating-System: Linux bart.theraso.int 6.5.9-arch2-1 
Organization: Personal
X-PGP-Key-FingerPrint: 5FEB 73AE 570B E46E 2952  66A7 27BE 1125 704B 8B02

Hi Thomas,

looks good to me and I agree with removing it, no need to maintain such
legacy piece of code anymore.

On Jan 05, 2024, at 10:11, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> From looking at the PCI IDs, every device supported by intelfb is
> also supported by i915. Anyone still using intelfb should please
> move on to i915, which does everything intelfb does but better.
>=20
> Removing intelfb is motivated by the driver's excessive use of the
> global screen_info state. The state belongs to architecture and
> firmware code; device drivers should not attempt to access it. But
> fixing intelfb would require a significant change in the driver's
> probing logic. As intelfb has been obsolete for nearly 2 decades,
> it is probably not worth the effort. Let's just remove it. Also
> remove the related documentation.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  Documentation/fb/index.rst                    |    1 -
>  Documentation/fb/intelfb.rst                  |  155 --
>  .../userspace-api/ioctl/ioctl-number.rst      |    1 -
>  MAINTAINERS                                   |    7 -
>  drivers/Makefile                              |    3 +-
>  drivers/video/fbdev/Kconfig                   |   39 -
>  drivers/video/fbdev/intelfb/Makefile          |    8 -
>  drivers/video/fbdev/intelfb/intelfb.h         |  382 ---
>  drivers/video/fbdev/intelfb/intelfb_i2c.c     |  209 --
>  drivers/video/fbdev/intelfb/intelfbdrv.c      | 1680 -------------
>  drivers/video/fbdev/intelfb/intelfbhw.c       | 2115 -----------------
>  drivers/video/fbdev/intelfb/intelfbhw.h       |  609 -----
>  12 files changed, 1 insertion(+), 5208 deletions(-)
>  delete mode 100644 Documentation/fb/intelfb.rst
>  delete mode 100644 drivers/video/fbdev/intelfb/Makefile
>  delete mode 100644 drivers/video/fbdev/intelfb/intelfb.h
>  delete mode 100644 drivers/video/fbdev/intelfb/intelfb_i2c.c
>  delete mode 100644 drivers/video/fbdev/intelfb/intelfbdrv.c
>  delete mode 100644 drivers/video/fbdev/intelfb/intelfbhw.c
>  delete mode 100644 drivers/video/fbdev/intelfb/intelfbhw.h
>=20
> diff --git a/Documentation/fb/index.rst b/Documentation/fb/index.rst
> index baf02393d8ee..33e3c49f8856 100644
> --- a/Documentation/fb/index.rst
> +++ b/Documentation/fb/index.rst
> @@ -19,7 +19,6 @@ Frame Buffer
>      framebuffer
>      gxfb
>      intel810
> -    intelfb
>      internals
>      lxfb
>      matroxfb
> diff --git a/Documentation/fb/intelfb.rst b/Documentation/fb/intelfb.rst
> deleted file mode 100644
> index e2d0903f4efb..000000000000
> --- a/Documentation/fb/intelfb.rst
> +++ /dev/null
> @@ -1,155 +0,0 @@
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Intel 830M/845G/852GM/855GM/865G/915G/945G Framebuffer driver
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -A. Introduction
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -This is a framebuffer driver for various Intel 8xx/9xx compatible
> -graphics devices.  These would include:
> -
> -	- Intel 830M
> -	- Intel 845G
> -	- Intel 852GM
> -	- Intel 855GM
> -	- Intel 865G
> -	- Intel 915G
> -	- Intel 915GM
> -	- Intel 945G
> -	- Intel 945GM
> -	- Intel 945GME
> -	- Intel 965G
> -	- Intel 965GM
> -
> -B.  List of available options
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> -
> -   a. "video=3Dintelfb"
> -	enables the intelfb driver
> -
> -	Recommendation: required
> -
> -   b. "mode=3D<xres>x<yres>[-<bpp>][@<refresh>]"
> -	select mode
> -
> -	Recommendation: user preference
> -	(default =3D 1024x768-32@70)
> -
> -   c. "vram=3D<value>"
> -	select amount of system RAM in MB to allocate for the video memory
> -	if not enough RAM was already allocated by the BIOS.
> -
> -	Recommendation: 1 - 4 MB.
> -	(default =3D 4 MB)
> -
> -   d. "voffset=3D<value>"
> -	select at what offset in MB of the logical memory to allocate the
> -	framebuffer memory.  The intent is to avoid the memory blocks
> -	used by standard graphics applications (XFree86). Depending on your
> -	usage, adjust the value up or down, (0 for maximum usage, 63/127 MB
> -	for the least amount).  Note, an arbitrary setting may conflict
> -	with XFree86.
> -
> -	Recommendation: do not set
> -	(default =3D 48 MB)
> -
> -   e. "accel"
> -	enable text acceleration.  This can be enabled/reenabled anytime
> -	by using 'fbset -accel true/false'.
> -
> -	Recommendation: enable
> -	(default =3D set)
> -
> -   f. "hwcursor"
> -	enable cursor acceleration.
> -
> -	Recommendation: enable
> -	(default =3D set)
> -
> -   g. "mtrr"
> -	enable MTRR.  This allows data transfers to the framebuffer memory
> -	to occur in bursts which can significantly increase performance.
> -	Not very helpful with the intel chips because of 'shared memory'.
> -
> -	Recommendation: set
> -	(default =3D set)
> -
> -   h. "fixed"
> -	disable mode switching.
> -
> -	Recommendation: do not set
> -	(default =3D not set)
> -
> -   The binary parameters can be unset with a "no" prefix, example "noacc=
el".
> -   The default parameter (not named) is the mode.
> -
> -C. Kernel booting
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Separate each option/option-pair by commas (,) and the option from its v=
alue
> -with an equals sign (=3D) as in the following::
> -
> -	video=3Dintelfb:option1,option2=3Dvalue2
> -
> -Sample Usage
> -------------
> -
> -In /etc/lilo.conf, add the line::
> -
> -	append=3D"video=3Dintelfb:mode=3D800x600-32@75,accel,hwcursor,vram=3D8"
> -
> -This will initialize the framebuffer to 800x600 at 32bpp and 75Hz. The
> -framebuffer will use 8 MB of System RAM. hw acceleration of text and cur=
sor
> -will be enabled.
> -
> -Remarks
> --------
> -
> -If setting this parameter doesn't work (you stay in a 80x25 text-mode),
> -you might need to set the "vga=3D<mode>" parameter too - see vesafb.txt
> -in this directory.
> -
> -
> -D.  Module options
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -The module parameters are essentially similar to the kernel
> -parameters. The main difference is that you need to include a Boolean va=
lue
> -(1 for TRUE, and 0 for FALSE) for those options which don't need a value.
> -
> -Example, to enable MTRR, include "mtrr=3D1".
> -
> -Sample Usage
> -------------
> -
> -Using the same setup as described above, load the module like this::
> -
> -	modprobe intelfb mode=3D800x600-32@75 vram=3D8 accel=3D1 hwcursor=3D1
> -
> -Or just add the following to a configuration file in /etc/modprobe.d/::
> -
> -	options intelfb mode=3D800x600-32@75 vram=3D8 accel=3D1 hwcursor=3D1
> -
> -and just do a::
> -
> -	modprobe intelfb
> -
> -
> -E.  Acknowledgment:
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -	1.  Geert Uytterhoeven - his excellent howto and the virtual
> -	    framebuffer driver code made this possible.
> -
> -	2.  Jeff Hartmann for his agpgart code.
> -
> -	3.  David Dawes for his original kernel 2.4 code.
> -
> -	4.  The X developers.  Insights were provided just by reading the
> -	    XFree86 source code.
> -
> -	5.  Antonino A. Daplas for his inspiring i810fb driver.
> -
> -	6.  Andrew Morton for his kernel patches maintenance.
> -
> -Sylvain
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documen=
tation/userspace-api/ioctl/ioctl-number.rst
> index 4ea5b837399a..08a1e2388614 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -128,7 +128,6 @@ Code  Seq#    Include File                           =
                Comments
>  'F'   all    linux/fb.h                                              con=
flict!
>  'F'   01-02  drivers/scsi/pmcraid.h                                  con=
flict!
>  'F'   20     drivers/video/fsl-diu-fb.h                              con=
flict!
> -'F'   20     drivers/video/intelfb/intelfb.h                         con=
flict!
>  'F'   20     linux/ivtvfb.h                                          con=
flict!
>  'F'   20     linux/matroxfb.h                                        con=
flict!
>  'F'   20     drivers/video/aty/atyfb_base.c                          con=
flict!
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d138317c9417..48450a0f6a8c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10666,13 +10666,6 @@ S:	Supported
>  F:	drivers/infiniband/hw/irdma/
>  F:	include/uapi/rdma/irdma-abi.h
> =20
> -INTEL FRAMEBUFFER DRIVER (excluding 810 and 815)
> -M:	Maik Broemme <mbroemme@libmpq.org>
> -L:	linux-fbdev@vger.kernel.org
> -S:	Maintained
> -F:	Documentation/fb/intelfb.rst
> -F:	drivers/video/fbdev/intelfb/
> -
>  INTEL GPIO DRIVERS
>  M:	Andy Shevchenko <andy@kernel.org>
>  L:	linux-gpio@vger.kernel.org
> diff --git a/drivers/Makefile b/drivers/Makefile
> index d828329c268d..37fd6ce3bd7f 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -71,9 +71,8 @@ obj-y				+=3D gpu/
> =20
>  obj-$(CONFIG_CONNECTOR)		+=3D connector/
> =20
> -# i810fb and intelfb depend on char/agp/
> +# i810fb depends on char/agp/
>  obj-$(CONFIG_FB_I810)           +=3D video/fbdev/i810/
> -obj-$(CONFIG_FB_INTEL)          +=3D video/fbdev/intelfb/
> =20
>  obj-$(CONFIG_PARPORT)		+=3D parport/
>  obj-y				+=3D base/ block/ misc/ mfd/ nfc/
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index d5909a9206ff..a57d8312667b 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -854,45 +854,6 @@ config FB_CARILLO_RANCH
>  	help
>  	  This driver supports the LE80578 (Carillo Ranch) board
> =20
> -config FB_INTEL
> -	tristate "Intel 830M/845G/852GM/855GM/865G/915G/945G/945GM/965G/965GM s=
upport"
> -	depends on FB && PCI && X86 && AGP_INTEL && EXPERT
> -	select FB_CFB_FILLRECT
> -	select FB_CFB_COPYAREA
> -	select FB_CFB_IMAGEBLIT
> -	select FB_IOMEM_FOPS
> -	select FB_MODE_HELPERS
> -	select BOOT_VESA_SUPPORT if FB_INTEL =3D y
> -	select VIDEO_NOMODESET
> -	depends on !DRM_I915
> -	help
> -	  This driver supports the on-board graphics built in to the Intel
> -	  830M/845G/852GM/855GM/865G/915G/915GM/945G/945GM/965G/965GM chipsets.
> -	  Say Y if you have and plan to use such a board.
> -
> -	  To make FB_INTEL=3DY work you need to say AGP_INTEL=3Dy too.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called intelfb.
> -
> -	  For more information, please read <file:Documentation/fb/intelfb.rst>
> -
> -config FB_INTEL_DEBUG
> -	bool "Intel driver Debug Messages"
> -	depends on FB_INTEL
> -	help
> -	  Say Y here if you want the Intel driver to output all sorts
> -	  of debugging information to provide to the maintainer when
> -	  something goes wrong.
> -
> -config FB_INTEL_I2C
> -	bool "DDC/I2C for Intel framebuffer support"
> -	depends on FB_INTEL
> -	select FB_DDC
> -	default y
> -	help
> -	  Say Y here if you want DDC/I2C support for your on-board Intel graphi=
cs.
> -
>  config FB_MATROX
>  	tristate "Matrox acceleration"
>  	depends on FB && PCI
> diff --git a/drivers/video/fbdev/intelfb/Makefile b/drivers/video/fbdev/i=
ntelfb/Makefile
> deleted file mode 100644
> index 7ff2debb31af..000000000000
> --- a/drivers/video/fbdev/intelfb/Makefile
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_FB_INTEL) +=3D intelfb.o
> -
> -intelfb-y :=3D intelfbdrv.o intelfbhw.o
> -intelfb-$(CONFIG_FB_INTEL_I2C) +=3D intelfb_i2c.o
> -intelfb-objs :=3D $(intelfb-y)
> -
> -ccflags-$(CONFIG_FB_INTEL_DEBUG) :=3D -DDEBUG -DREGDUMP
> diff --git a/drivers/video/fbdev/intelfb/intelfb.h b/drivers/video/fbdev/=
intelfb/intelfb.h
> deleted file mode 100644
> index 5de703902a21..000000000000
> --- a/drivers/video/fbdev/intelfb/intelfb.h
> +++ /dev/null
> @@ -1,382 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _INTELFB_H
> -#define _INTELFB_H
> -
> -/* $DHD: intelfb/intelfb.h,v 1.40 2003/06/27 15:06:25 dawes Exp $ */
> -
> -#include <linux/agp_backend.h>
> -#include <linux/fb.h>
> -
> -#ifdef CONFIG_FB_INTEL_I2C
> -#include <linux/i2c.h>
> -#include <linux/i2c-algo-bit.h>
> -#endif
> -
> -/*** Version/name ***/
> -#define INTELFB_VERSION			"0.9.6"
> -#define INTELFB_MODULE_NAME		"intelfb"
> -#define SUPPORTED_CHIPSETS		"830M/845G/852GM/855GM/865G/915G/915GM/945G/=
945GM/945GME/965G/965GM"
> -
> -
> -/*** Debug/feature defines ***/
> -
> -#ifndef DEBUG
> -#define DEBUG				0
> -#endif
> -
> -#ifndef VERBOSE
> -#define VERBOSE				0
> -#endif
> -
> -#ifndef REGDUMP
> -#define REGDUMP				0
> -#endif
> -
> -#ifndef DETECT_VGA_CLASS_ONLY
> -#define DETECT_VGA_CLASS_ONLY		1
> -#endif
> -
> -#ifndef ALLOCATE_FOR_PANNING
> -#define ALLOCATE_FOR_PANNING		1
> -#endif
> -
> -#ifndef PREFERRED_MODE
> -#define PREFERRED_MODE			"1024x768-32@70"
> -#endif
> -
> -/*** hw-related values ***/
> -
> -/* Resource Allocation */
> -#define INTELFB_FB_ACQUIRED                 1
> -#define INTELFB_MMIO_ACQUIRED               2
> -
> -/* PCI ids for supported devices */
> -#define PCI_DEVICE_ID_INTEL_830M	0x3577
> -#define PCI_DEVICE_ID_INTEL_845G	0x2562
> -#define PCI_DEVICE_ID_INTEL_85XGM	0x3582
> -#define PCI_DEVICE_ID_INTEL_854		0x358E
> -#define PCI_DEVICE_ID_INTEL_865G	0x2572
> -#define PCI_DEVICE_ID_INTEL_915G	0x2582
> -#define PCI_DEVICE_ID_INTEL_915GM	0x2592
> -#define PCI_DEVICE_ID_INTEL_945G	0x2772
> -#define PCI_DEVICE_ID_INTEL_945GM	0x27A2
> -#define PCI_DEVICE_ID_INTEL_945GME	0x27AE
> -#define PCI_DEVICE_ID_INTEL_965G	0x29A2
> -#define PCI_DEVICE_ID_INTEL_965GM	0x2A02
> -
> -/* Size of MMIO region */
> -#define INTEL_REG_SIZE			0x80000
> -
> -#define STRIDE_ALIGNMENT		16
> -#define STRIDE_ALIGNMENT_I9XX		64
> -
> -#define PALETTE_8_ENTRIES		256
> -
> -
> -/*** Macros ***/
> -
> -/* basic arithmetic */
> -#define KB(x)			((x) * 1024)
> -#define MB(x)			((x) * 1024 * 1024)
> -#define BtoKB(x)		((x) / 1024)
> -#define BtoMB(x)		((x) / 1024 / 1024)
> -
> -#define GTT_PAGE_SIZE           KB(4)
> -
> -#define ROUND_UP_TO(x, y)	(((x) + (y) - 1) / (y) * (y))
> -#define ROUND_DOWN_TO(x, y)	((x) / (y) * (y))
> -#define ROUND_UP_TO_PAGE(x)	ROUND_UP_TO((x), GTT_PAGE_SIZE)
> -#define ROUND_DOWN_TO_PAGE(x)	ROUND_DOWN_TO((x), GTT_PAGE_SIZE)
> -
> -/* messages */
> -#define PFX			INTELFB_MODULE_NAME ": "
> -
> -#define ERR_MSG(fmt, args...)	printk(KERN_ERR PFX fmt, ## args)
> -#define WRN_MSG(fmt, args...)	printk(KERN_WARNING PFX fmt, ## args)
> -#define NOT_MSG(fmt, args...)	printk(KERN_NOTICE PFX fmt, ## args)
> -#define INF_MSG(fmt, args...)	printk(KERN_INFO PFX fmt, ## args)
> -#if DEBUG
> -#define DBG_MSG(fmt, args...)	printk(KERN_DEBUG PFX fmt, ## args)
> -#else
> -#define DBG_MSG(fmt, args...)	while (0) printk(fmt, ## args)
> -#endif
> -
> -/* get commonly used pointers */
> -#define GET_DINFO(info)		(info)->par
> -
> -/* misc macros */
> -#define ACCEL(d, i)                                                     \
> -	((d)->accel && !(d)->ring_lockup &&                             \
> -	 ((i)->var.accel_flags & FB_ACCELF_TEXT))
> -
> -/*#define NOACCEL_CHIPSET(d)						\
> -	((d)->chipset !=3D INTEL_865G)*/
> -#define NOACCEL_CHIPSET(d)						\
> -	(0)
> -
> -#define FIXED_MODE(d) ((d)->fixed_mode)
> -
> -/*** Driver parameters ***/
> -
> -#define RINGBUFFER_SIZE		KB(64)
> -#define HW_CURSOR_SIZE		KB(4)
> -
> -/* Intel agpgart driver */
> -#define AGP_PHYSICAL_MEMORY     2
> -
> -/* store information about an Ixxx DVO */
> -/* The i830->i865 use multiple DVOs with multiple i2cs */
> -/* the i915, i945 have a single sDVO i2c bus - which is different */
> -#define MAX_OUTPUTS 6
> -
> -/* these are outputs from the chip - integrated only
> -   external chips are via DVO or SDVO output */
> -#define INTELFB_OUTPUT_UNUSED 0
> -#define INTELFB_OUTPUT_ANALOG 1
> -#define INTELFB_OUTPUT_DVO 2
> -#define INTELFB_OUTPUT_SDVO 3
> -#define INTELFB_OUTPUT_LVDS 4
> -#define INTELFB_OUTPUT_TVOUT 5
> -
> -#define INTELFB_DVO_CHIP_NONE 0
> -#define INTELFB_DVO_CHIP_LVDS 1
> -#define INTELFB_DVO_CHIP_TMDS 2
> -#define INTELFB_DVO_CHIP_TVOUT 4
> -
> -#define INTELFB_OUTPUT_PIPE_NC  0
> -#define INTELFB_OUTPUT_PIPE_A   1
> -#define INTELFB_OUTPUT_PIPE_B   2
> -
> -/*** Data Types ***/
> -
> -/* supported chipsets */
> -enum intel_chips {
> -	INTEL_830M,
> -	INTEL_845G,
> -	INTEL_85XGM,
> -	INTEL_852GM,
> -	INTEL_852GME,
> -	INTEL_854,
> -	INTEL_855GM,
> -	INTEL_855GME,
> -	INTEL_865G,
> -	INTEL_915G,
> -	INTEL_915GM,
> -	INTEL_945G,
> -	INTEL_945GM,
> -	INTEL_945GME,
> -	INTEL_965G,
> -	INTEL_965GM,
> -};
> -
> -struct intelfb_hwstate {
> -	u32 vga0_divisor;
> -	u32 vga1_divisor;
> -	u32 vga_pd;
> -	u32 dpll_a;
> -	u32 dpll_b;
> -	u32 fpa0;
> -	u32 fpa1;
> -	u32 fpb0;
> -	u32 fpb1;
> -	u32 palette_a[PALETTE_8_ENTRIES];
> -	u32 palette_b[PALETTE_8_ENTRIES];
> -	u32 htotal_a;
> -	u32 hblank_a;
> -	u32 hsync_a;
> -	u32 vtotal_a;
> -	u32 vblank_a;
> -	u32 vsync_a;
> -	u32 src_size_a;
> -	u32 bclrpat_a;
> -	u32 htotal_b;
> -	u32 hblank_b;
> -	u32 hsync_b;
> -	u32 vtotal_b;
> -	u32 vblank_b;
> -	u32 vsync_b;
> -	u32 src_size_b;
> -	u32 bclrpat_b;
> -	u32 adpa;
> -	u32 dvoa;
> -	u32 dvob;
> -	u32 dvoc;
> -	u32 dvoa_srcdim;
> -	u32 dvob_srcdim;
> -	u32 dvoc_srcdim;
> -	u32 lvds;
> -	u32 pipe_a_conf;
> -	u32 pipe_b_conf;
> -	u32 disp_arb;
> -	u32 cursor_a_control;
> -	u32 cursor_b_control;
> -	u32 cursor_a_base;
> -	u32 cursor_b_base;
> -	u32 cursor_size;
> -	u32 disp_a_ctrl;
> -	u32 disp_b_ctrl;
> -	u32 disp_a_base;
> -	u32 disp_b_base;
> -	u32 cursor_a_palette[4];
> -	u32 cursor_b_palette[4];
> -	u32 disp_a_stride;
> -	u32 disp_b_stride;
> -	u32 vgacntrl;
> -	u32 add_id;
> -	u32 swf0x[7];
> -	u32 swf1x[7];
> -	u32 swf3x[3];
> -	u32 fence[8];
> -	u32 instpm;
> -	u32 mem_mode;
> -	u32 fw_blc_0;
> -	u32 fw_blc_1;
> -	u16 hwstam;
> -	u16 ier;
> -	u16 iir;
> -	u16 imr;
> -};
> -
> -struct intelfb_heap_data {
> -	u32 physical;
> -	u8 __iomem *virtual;
> -	u32 offset;		/* in GATT pages */
> -	u32 size;		/* in bytes */
> -};
> -
> -#ifdef CONFIG_FB_INTEL_I2C
> -struct intelfb_i2c_chan {
> -    struct intelfb_info *dinfo;
> -    u32 reg;
> -    struct i2c_adapter adapter;
> -    struct i2c_algo_bit_data algo;
> -};
> -#endif
> -
> -struct intelfb_output_rec {
> -    int type;
> -    int pipe;
> -    int flags;
> -
> -#ifdef CONFIG_FB_INTEL_I2C
> -    struct intelfb_i2c_chan i2c_bus;
> -    struct intelfb_i2c_chan ddc_bus;
> -#endif
> -};
> -
> -struct intelfb_vsync {
> -	wait_queue_head_t wait;
> -	unsigned int count;
> -	int pan_display;
> -	u32 pan_offset;
> -};
> -
> -struct intelfb_info {
> -	struct fb_info *info;
> -	const struct fb_ops *fbops;
> -	struct pci_dev *pdev;
> -
> -	struct intelfb_hwstate save_state;
> -
> -	/* agpgart structs */
> -	struct agp_memory *gtt_fb_mem;     /* use all stolen memory or vram */
> -	struct agp_memory *gtt_ring_mem;   /* ring buffer */
> -	struct agp_memory *gtt_cursor_mem; /* hw cursor */
> -
> -	/* use a gart reserved fb mem */
> -	u8 fbmem_gart;
> -
> -	int wc_cookie;
> -
> -	/* heap data */
> -	struct intelfb_heap_data aperture;
> -	struct intelfb_heap_data fb;
> -	struct intelfb_heap_data ring;
> -	struct intelfb_heap_data cursor;
> -
> -	/* mmio regs */
> -	u32 mmio_base_phys;
> -	u8 __iomem *mmio_base;
> -
> -	/* fb start offset (in bytes) */
> -	u32 fb_start;
> -
> -	/* ring buffer */
> -	u32 ring_head;
> -	u32 ring_tail;
> -	u32 ring_tail_mask;
> -	u32 ring_space;
> -	u32 ring_lockup;
> -
> -	/* palette */
> -	u32 pseudo_palette[16];
> -
> -	/* chip info */
> -	int pci_chipset;
> -	int chipset;
> -	const char *name;
> -	int mobile;
> -
> -	/* current mode */
> -	int bpp, depth;
> -	u32 visual;
> -	int xres, yres, pitch;
> -	int pixclock;
> -
> -	/* current pipe */
> -	int pipe;
> -
> -	/* some flags */
> -	int accel;
> -	int hwcursor;
> -	int fixed_mode;
> -	int ring_active;
> -	int flag;
> -	unsigned long irq_flags;
> -	int open;
> -
> -	/* vsync */
> -	struct intelfb_vsync vsync;
> -	spinlock_t int_lock;
> -
> -	/* hw cursor */
> -	int cursor_on;
> -	int cursor_blanked;
> -	u8  cursor_src[64];
> -
> -	/* initial parameters */
> -	int initial_vga;
> -	struct fb_var_screeninfo initial_var;
> -	u32 initial_fb_base;
> -	u32 initial_video_ram;
> -	u32 initial_pitch;
> -
> -	/* driver registered */
> -	int registered;
> -
> -	/* index into plls */
> -	int pll_index;
> -
> -	/* outputs */
> -	int num_outputs;
> -	struct intelfb_output_rec output[MAX_OUTPUTS];
> -};
> -
> -#define IS_I9XX(dinfo) (((dinfo)->chipset =3D=3D INTEL_915G) ||	\
> -			((dinfo)->chipset =3D=3D INTEL_915GM) ||	\
> -			((dinfo)->chipset =3D=3D INTEL_945G) ||	\
> -			((dinfo)->chipset =3D=3D INTEL_945GM) ||	\
> -			((dinfo)->chipset =3D=3D INTEL_945GME) ||	\
> -			((dinfo)->chipset =3D=3D INTEL_965G) ||	\
> -			((dinfo)->chipset =3D=3D INTEL_965GM))
> -
> -/*** function prototypes ***/
> -
> -extern int intelfb_var_to_depth(const struct fb_var_screeninfo *var);
> -
> -#ifdef CONFIG_FB_INTEL_I2C
> -extern void intelfb_create_i2c_busses(struct intelfb_info *dinfo);
> -extern void intelfb_delete_i2c_busses(struct intelfb_info *dinfo);
> -#endif
> -
> -#endif /* _INTELFB_H */
> diff --git a/drivers/video/fbdev/intelfb/intelfb_i2c.c b/drivers/video/fb=
dev/intelfb/intelfb_i2c.c
> deleted file mode 100644
> index 3300bd31d9d7..000000000000
> --- a/drivers/video/fbdev/intelfb/intelfb_i2c.c
> +++ /dev/null
> @@ -1,209 +0,0 @@
> -/***********************************************************************=
***
> -
> - Copyright 2006 Dave Airlie <airlied@linux.ie>
> -
> -All Rights Reserved.
> -
> -Permission is hereby granted, free of charge, to any person obtaining a
> -copy of this software and associated documentation files (the "Software"=
),
> -to deal in the Software without restriction, including without limitation
> -on the rights to use, copy, modify, merge, publish, distribute, sub
> -license, and/or sell copies of the Software, and to permit persons to wh=
om
> -the Software is furnished to do so, subject to the following conditions:
> -
> -The above copyright notice and this permission notice (including the next
> -paragraph) shall be included in all copies or substantial portions of the
> -Software.
> -
> -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS =
OR
> -IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> -FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> -THE COPYRIGHT HOLDERS AND/OR THEIR SUPPLIERS BE LIABLE FOR ANY CLAIM,
> -DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> -OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -USE OR OTHER DEALINGS IN THE SOFTWARE.
> -
> -************************************************************************=
**/
> -
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/delay.h>
> -#include <linux/pci.h>
> -#include <linux/fb.h>
> -
> -#include <linux/i2c.h>
> -#include <linux/i2c-algo-bit.h>
> -
> -#include <asm/io.h>
> -
> -#include "intelfb.h"
> -#include "intelfbhw.h"
> -
> -/* bit locations in the registers */
> -#define SCL_DIR_MASK		0x0001
> -#define SCL_DIR			0x0002
> -#define SCL_VAL_MASK		0x0004
> -#define SCL_VAL_OUT		0x0008
> -#define SCL_VAL_IN		0x0010
> -#define SDA_DIR_MASK		0x0100
> -#define SDA_DIR			0x0200
> -#define SDA_VAL_MASK		0x0400
> -#define SDA_VAL_OUT		0x0800
> -#define SDA_VAL_IN		0x1000
> -
> -static void intelfb_gpio_setscl(void *data, int state)
> -{
> -	struct intelfb_i2c_chan *chan =3D data;
> -	struct intelfb_info *dinfo =3D chan->dinfo;
> -	u32 val;
> -
> -	OUTREG(chan->reg, (state ? SCL_VAL_OUT : 0) |
> -	       SCL_DIR | SCL_DIR_MASK | SCL_VAL_MASK);
> -	val =3D INREG(chan->reg);
> -}
> -
> -static void intelfb_gpio_setsda(void *data, int state)
> -{
> -	struct intelfb_i2c_chan *chan =3D data;
> -	struct intelfb_info *dinfo =3D chan->dinfo;
> -	u32 val;
> -
> -	OUTREG(chan->reg, (state ? SDA_VAL_OUT : 0) |
> -	       SDA_DIR | SDA_DIR_MASK | SDA_VAL_MASK);
> -	val =3D INREG(chan->reg);
> -}
> -
> -static int intelfb_gpio_getscl(void *data)
> -{
> -	struct intelfb_i2c_chan *chan =3D data;
> -	struct intelfb_info *dinfo =3D chan->dinfo;
> -	u32 val;
> -
> -	OUTREG(chan->reg, SCL_DIR_MASK);
> -	OUTREG(chan->reg, 0);
> -	val =3D INREG(chan->reg);
> -	return ((val & SCL_VAL_IN) !=3D 0);
> -}
> -
> -static int intelfb_gpio_getsda(void *data)
> -{
> -	struct intelfb_i2c_chan *chan =3D data;
> -	struct intelfb_info *dinfo =3D chan->dinfo;
> -	u32 val;
> -
> -	OUTREG(chan->reg, SDA_DIR_MASK);
> -	OUTREG(chan->reg, 0);
> -	val =3D INREG(chan->reg);
> -	return ((val & SDA_VAL_IN) !=3D 0);
> -}
> -
> -static int intelfb_setup_i2c_bus(struct intelfb_info *dinfo,
> -				 struct intelfb_i2c_chan *chan,
> -				 const u32 reg, const char *name,
> -				 int class)
> -{
> -	int rc;
> -
> -	chan->dinfo			=3D dinfo;
> -	chan->reg			=3D reg;
> -	snprintf(chan->adapter.name, sizeof(chan->adapter.name),
> -		 "intelfb %s", name);
> -	chan->adapter.class		=3D class;
> -	chan->adapter.owner		=3D THIS_MODULE;
> -	chan->adapter.algo_data		=3D &chan->algo;
> -	chan->adapter.dev.parent	=3D &chan->dinfo->pdev->dev;
> -	chan->algo.setsda		=3D intelfb_gpio_setsda;
> -	chan->algo.setscl		=3D intelfb_gpio_setscl;
> -	chan->algo.getsda		=3D intelfb_gpio_getsda;
> -	chan->algo.getscl		=3D intelfb_gpio_getscl;
> -	chan->algo.udelay		=3D 40;
> -	chan->algo.timeout		=3D 20;
> -	chan->algo.data			=3D chan;
> -
> -	i2c_set_adapdata(&chan->adapter, chan);
> -
> -	/* Raise SCL and SDA */
> -	intelfb_gpio_setsda(chan, 1);
> -	intelfb_gpio_setscl(chan, 1);
> -	udelay(20);
> -
> -	rc =3D i2c_bit_add_bus(&chan->adapter);
> -	if (rc =3D=3D 0)
> -		DBG_MSG("I2C bus %s registered.\n", name);
> -	else
> -		WRN_MSG("Failed to register I2C bus %s.\n", name);
> -	return rc;
> -}
> -
> -void intelfb_create_i2c_busses(struct intelfb_info *dinfo)
> -{
> -	int i =3D 0;
> -
> -	/* everyone has at least a single analog output */
> -	dinfo->num_outputs =3D 1;
> -	dinfo->output[i].type =3D INTELFB_OUTPUT_ANALOG;
> -
> -	/* setup the DDC bus for analog output */
> -	intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus, GPIOA,
> -			      "CRTDDC_A", I2C_CLASS_DDC);
> -	i++;
> -
> -	/* need to add the output busses for each device
> -	   - this function is very incomplete
> -	   - i915GM has LVDS and TVOUT for example
> -	*/
> -	switch(dinfo->chipset) {
> -	case INTEL_830M:
> -	case INTEL_845G:
> -	case INTEL_854:
> -	case INTEL_855GM:
> -	case INTEL_865G:
> -		dinfo->output[i].type =3D INTELFB_OUTPUT_DVO;
> -		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus,
> -				      GPIOD, "DVODDC_D", I2C_CLASS_DDC);
> -		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus,
> -				      GPIOE, "DVOI2C_E", 0);
> -		i++;
> -		break;
> -	case INTEL_915G:
> -	case INTEL_915GM:
> -		/* has some LVDS + tv-out */
> -	case INTEL_945G:
> -	case INTEL_945GM:
> -	case INTEL_945GME:
> -	case INTEL_965G:
> -	case INTEL_965GM:
> -		/* SDVO ports have a single control bus - 2 devices */
> -		dinfo->output[i].type =3D INTELFB_OUTPUT_SDVO;
> -		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus,
> -				      GPIOE, "SDVOCTRL_E", 0);
> -		/* TODO: initialize the SDVO */
> -		/* I830SDVOInit(pScrn, i, DVOB); */
> -		i++;
> -
> -		/* set up SDVOC */
> -		dinfo->output[i].type =3D INTELFB_OUTPUT_SDVO;
> -		dinfo->output[i].i2c_bus =3D dinfo->output[i - 1].i2c_bus;
> -		/* TODO: initialize the SDVO */
> -		/* I830SDVOInit(pScrn, i, DVOC); */
> -		i++;
> -		break;
> -	}
> -	dinfo->num_outputs =3D i;
> -}
> -
> -void intelfb_delete_i2c_busses(struct intelfb_info *dinfo)
> -{
> -	int i;
> -
> -	for (i =3D 0; i < MAX_OUTPUTS; i++) {
> -		if (dinfo->output[i].i2c_bus.dinfo) {
> -			i2c_del_adapter(&dinfo->output[i].i2c_bus.adapter);
> -			dinfo->output[i].i2c_bus.dinfo =3D NULL;
> -		}
> -		if (dinfo->output[i].ddc_bus.dinfo) {
> -			i2c_del_adapter(&dinfo->output[i].ddc_bus.adapter);
> -			dinfo->output[i].ddc_bus.dinfo =3D NULL;
> -		}
> -	}
> -}
> diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbd=
ev/intelfb/intelfbdrv.c
> deleted file mode 100644
> index d29d80a16295..000000000000
> --- a/drivers/video/fbdev/intelfb/intelfbdrv.c
> +++ /dev/null
> @@ -1,1680 +0,0 @@
> -/*
> - * intelfb
> - *
> - * Linux framebuffer driver for Intel(R) 830M/845G/852GM/855GM/865G/915G=
/915GM/
> - * 945G/945GM/945GME/965G/965GM integrated graphics chips.
> - *
> - * Copyright =A9 2002, 2003 David Dawes <dawes@xfree86.org>
> - *                   2004 Sylvain Meyer
> - *                   2006 David Airlie
> - *
> - * This driver consists of two parts.  The first part (intelfbdrv.c) pro=
vides
> - * the basic fbdev interfaces, is derived in part from the radeonfb and
> - * vesafb drivers, and is covered by the GPL.  The second part (intelfbh=
w.c)
> - * provides the code to program the hardware.  Most of it is derived from
> - * the i810/i830 XFree86 driver.  The HW-specific code is covered here
> - * under a dual license (GPL and MIT/XFree86 license).
> - *
> - * Author: David Dawes
> - *
> - */
> -
> -/* $DHD: intelfb/intelfbdrv.c,v 1.20 2003/06/27 15:17:40 dawes Exp $ */
> -
> -/*
> - * Changes:
> - *    01/2003 - Initial driver (0.1.0), no mode switching, no accelerati=
on.
> - *		This initial version is a basic core that works a lot like
> - *		the vesafb driver.  It must be built-in to the kernel,
> - *		and the initial video mode must be set with vga=3DXXX at
> - *		boot time.  (David Dawes)
> - *
> - *    01/2003 - Version 0.2.0: Mode switching added, colormap support
> - *		implemented, Y panning, and soft screen blanking implemented.
> - *		No acceleration yet.  (David Dawes)
> - *
> - *    01/2003 - Version 0.3.0: fbcon acceleration support added.  Module
> - *		option handling added.  (David Dawes)
> - *
> - *    01/2003 - Version 0.4.0: fbcon HW cursor support added.  (David Da=
wes)
> - *
> - *    01/2003 - Version 0.4.1: Add auto-generation of built-in modes.
> - *		(David Dawes)
> - *
> - *    02/2003 - Version 0.4.2: Add check for active non-CRT devices, and
> - *		mode validation checks.  (David Dawes)
> - *
> - *    02/2003 - Version 0.4.3: Check when the VC is in graphics mode so =
that
> - *		acceleration is disabled while an XFree86 server is running.
> - *		(David Dawes)
> - *
> - *    02/2003 - Version 0.4.4: Monitor DPMS support.  (David Dawes)
> - *
> - *    02/2003 - Version 0.4.5: Basic XFree86 + fbdev working.  (David Da=
wes)
> - *
> - *    02/2003 - Version 0.5.0: Modify to work with the 2.5.32 kernel as =
well
> - *		as 2.4.x kernels.  (David Dawes)
> - *
> - *    02/2003 - Version 0.6.0: Split out HW-specifics into a separate fi=
le.
> - *		(David Dawes)
> - *
> - *    02/2003 - Version 0.7.0: Test on 852GM/855GM.  Acceleration and HW
> - *		cursor are disabled on this platform.  (David Dawes)
> - *
> - *    02/2003 - Version 0.7.1: Test on 845G.  Acceleration is disabled
> - *		on this platform.  (David Dawes)
> - *
> - *    02/2003 - Version 0.7.2: Test on 830M.  Acceleration and HW
> - *		cursor are disabled on this platform.  (David Dawes)
> - *
> - *    02/2003 - Version 0.7.3: Fix 8-bit modes for mobile platforms
> - *		(David Dawes)
> - *
> - *    02/2003 - Version 0.7.4: Add checks for FB and FBCON_HAS_CFB* conf=
igured
> - *		in the kernel, and add mode bpp verification and default
> - *		bpp selection based on which FBCON_HAS_CFB* are configured.
> - *		(David Dawes)
> - *
> - *    02/2003 - Version 0.7.5: Add basic package/install scripts based o=
n the
> - *		DRI packaging scripts.  (David Dawes)
> - *
> - *    04/2003 - Version 0.7.6: Fix typo that affects builds with SMP-ena=
bled
> - *		kernels.  (David Dawes, reported by Anupam).
> - *
> - *    06/2003 - Version 0.7.7:
> - *              Fix Makefile.kernel build problem (Tsutomu Yasuda).
> - *		Fix mis-placed #endif (2.4.21 kernel).
> - *
> - *    09/2004 - Version 0.9.0 - by Sylvain Meyer
> - *              Port to linux 2.6 kernel fbdev
> - *              Fix HW accel and HW cursor on i845G
> - *              Use of agpgart for fb memory reservation
> - *              Add mtrr support
> - *
> - *    10/2004 - Version 0.9.1
> - *              Use module_param instead of old MODULE_PARM
> - *              Some cleanup
> - *
> - *    11/2004 - Version 0.9.2
> - *              Add vram option to reserve more memory than stolen by BI=
OS
> - *              Fix intelfbhw_pan_display typo
> - *              Add __initdata annotations
> - *
> - *    04/2008 - Version 0.9.5
> - *              Add support for 965G/965GM. (Maik Broemme <mbroemme@plus=
server.de>)
> - *
> - *    08/2008 - Version 0.9.6
> - *              Add support for 945GME. (Phil Endecott <spam_from_intelf=
b@chezphil.org>)
> - */
> -
> -#include <linux/aperture.h>
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/errno.h>
> -#include <linux/string.h>
> -#include <linux/mm.h>
> -#include <linux/slab.h>
> -#include <linux/delay.h>
> -#include <linux/fb.h>
> -#include <linux/ioport.h>
> -#include <linux/init.h>
> -#include <linux/pci.h>
> -#include <linux/vmalloc.h>
> -#include <linux/pagemap.h>
> -#include <linux/screen_info.h>
> -
> -#include <asm/io.h>
> -
> -#include "intelfb.h"
> -#include "intelfbhw.h"
> -#include "../edid.h"
> -
> -static void get_initial_mode(struct intelfb_info *dinfo);
> -static void update_dinfo(struct intelfb_info *dinfo,
> -			 struct fb_var_screeninfo *var);
> -static int intelfb_open(struct fb_info *info, int user);
> -static int intelfb_release(struct fb_info *info, int user);
> -static int intelfb_check_var(struct fb_var_screeninfo *var,
> -			     struct fb_info *info);
> -static int intelfb_set_par(struct fb_info *info);
> -static int intelfb_setcolreg(unsigned regno, unsigned red, unsigned gree=
n,
> -			     unsigned blue, unsigned transp,
> -			     struct fb_info *info);
> -
> -static int intelfb_blank(int blank, struct fb_info *info);
> -static int intelfb_pan_display(struct fb_var_screeninfo *var,
> -			       struct fb_info *info);
> -
> -static void intelfb_fillrect(struct fb_info *info,
> -			     const struct fb_fillrect *rect);
> -static void intelfb_copyarea(struct fb_info *info,
> -			     const struct fb_copyarea *region);
> -static void intelfb_imageblit(struct fb_info *info,
> -			      const struct fb_image *image);
> -static int intelfb_cursor(struct fb_info *info,
> -			   struct fb_cursor *cursor);
> -
> -static int intelfb_sync(struct fb_info *info);
> -
> -static int intelfb_ioctl(struct fb_info *info,
> -			 unsigned int cmd, unsigned long arg);
> -
> -static int intelfb_pci_register(struct pci_dev *pdev,
> -				const struct pci_device_id *ent);
> -static void intelfb_pci_unregister(struct pci_dev *pdev);
> -static int intelfb_set_fbinfo(struct intelfb_info *dinfo);
> -
> -/*
> - * Limiting the class to PCI_CLASS_DISPLAY_VGA prevents function 1 of the
> - * mobile chipsets from being registered.
> - */
> -#if DETECT_VGA_CLASS_ONLY
> -#define INTELFB_CLASS_MASK ~0 << 8
> -#else
> -#define INTELFB_CLASS_MASK 0
> -#endif
> -
> -static const struct pci_device_id intelfb_pci_table[] =3D {
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_830M, PCI_ANY_ID, PCI_ANY_ID=
, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_830M },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_845G, PCI_ANY_ID, PCI_ANY_ID=
, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_845G },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_85XGM, PCI_ANY_ID, PCI_ANY_I=
D, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_85XGM },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_865G, PCI_ANY_ID, PCI_ANY_ID=
, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_865G },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_854, PCI_ANY_ID, PCI_ANY_ID,=
 PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_854 },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_915G, PCI_ANY_ID, PCI_ANY_ID=
, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_915G },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_915GM, PCI_ANY_ID, PCI_ANY_I=
D, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_915GM },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_945G, PCI_ANY_ID, PCI_ANY_ID=
, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_945G },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_945GM, PCI_ANY_ID, PCI_ANY_I=
D, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_945GM },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_945GME, PCI_ANY_ID, PCI_ANY_=
ID, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_945GME },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_965G, PCI_ANY_ID, PCI_ANY_ID=
, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_965G },
> -	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_965GM, PCI_ANY_ID, PCI_ANY_I=
D, PCI_CLASS_DISPLAY_VGA << 8, INTELFB_CLASS_MASK, INTEL_965GM },
> -	{ 0, }
> -};
> -
> -/* Global data */
> -static int num_registered =3D 0;
> -
> -/* fb ops */
> -static const struct fb_ops intel_fb_ops =3D {
> -	.owner =3D		THIS_MODULE,
> -	.fb_open =3D              intelfb_open,
> -	.fb_release =3D           intelfb_release,
> -	__FB_DEFAULT_IOMEM_OPS_RDWR,
> -	.fb_check_var =3D         intelfb_check_var,
> -	.fb_set_par =3D           intelfb_set_par,
> -	.fb_setcolreg =3D		intelfb_setcolreg,
> -	.fb_blank =3D		intelfb_blank,
> -	.fb_pan_display =3D       intelfb_pan_display,
> -	.fb_fillrect  =3D         intelfb_fillrect,
> -	.fb_copyarea  =3D         intelfb_copyarea,
> -	.fb_imageblit =3D         intelfb_imageblit,
> -	.fb_cursor =3D            intelfb_cursor,
> -	.fb_sync =3D              intelfb_sync,
> -	.fb_ioctl =3D		intelfb_ioctl,
> -	__FB_DEFAULT_IOMEM_OPS_MMAP,
> -};
> -
> -/* PCI driver module table */
> -static struct pci_driver intelfb_driver =3D {
> -	.name =3D		"intelfb",
> -	.id_table =3D	intelfb_pci_table,
> -	.probe =3D	intelfb_pci_register,
> -	.remove =3D	intelfb_pci_unregister,
> -};
> -
> -/* Module description/parameters */
> -MODULE_AUTHOR("David Dawes <dawes@tungstengraphics.com>, "
> -	      "Sylvain Meyer <sylvain.meyer@worldonline.fr>");
> -MODULE_DESCRIPTION("Framebuffer driver for Intel(R) " SUPPORTED_CHIPSETS
> -		   " chipsets");
> -MODULE_LICENSE("Dual BSD/GPL");
> -MODULE_DEVICE_TABLE(pci, intelfb_pci_table);
> -
> -static bool accel       =3D 1;
> -static int vram         =3D 4;
> -static bool hwcursor    =3D 0;
> -static bool mtrr        =3D 1;
> -static bool fixed       =3D 0;
> -static bool noinit      =3D 0;
> -static bool noregister  =3D 0;
> -static bool probeonly   =3D 0;
> -static bool idonly      =3D 0;
> -static int bailearly    =3D 0;
> -static int voffset	=3D 48;
> -static char *mode       =3D NULL;
> -
> -module_param(accel, bool, S_IRUGO);
> -MODULE_PARM_DESC(accel, "Enable hardware acceleration");
> -module_param(vram, int, S_IRUGO);
> -MODULE_PARM_DESC(vram, "System RAM to allocate to framebuffer in MiB");
> -module_param(voffset, int, S_IRUGO);
> -MODULE_PARM_DESC(voffset, "Offset of framebuffer in MiB");
> -module_param(hwcursor, bool, S_IRUGO);
> -MODULE_PARM_DESC(hwcursor, "Enable HW cursor");
> -module_param(mtrr, bool, S_IRUGO);
> -MODULE_PARM_DESC(mtrr, "Enable MTRR support");
> -module_param(fixed, bool, S_IRUGO);
> -MODULE_PARM_DESC(fixed, "Disable mode switching");
> -module_param(noinit, bool, 0);
> -MODULE_PARM_DESC(noinit, "Don't initialise graphics mode when loading");
> -module_param(noregister, bool, 0);
> -MODULE_PARM_DESC(noregister, "Don't register, just probe and exit (debug=
)");
> -module_param(probeonly, bool, 0);
> -MODULE_PARM_DESC(probeonly, "Do a minimal probe (debug)");
> -module_param(idonly, bool, 0);
> -MODULE_PARM_DESC(idonly, "Just identify without doing anything else (deb=
ug)");
> -module_param(bailearly, int, 0);
> -MODULE_PARM_DESC(bailearly, "Bail out early, depending on value (debug)"=
);
> -module_param(mode, charp, S_IRUGO);
> -MODULE_PARM_DESC(mode,
> -		 "Initial video mode \"<xres>x<yres>[-<depth>][@<refresh>]\"");
> -
> -#ifndef MODULE
> -#define OPT_EQUAL(opt, name) (!strncmp(opt, name, strlen(name)))
> -#define OPT_INTVAL(opt, name) simple_strtoul(opt + strlen(name) + 1, NUL=
L, 0)
> -#define OPT_STRVAL(opt, name) (opt + strlen(name))
> -
> -static __inline__ char * get_opt_string(const char *this_opt, const char=
 *name)
> -{
> -	const char *p;
> -	int i;
> -	char *ret;
> -
> -	p =3D OPT_STRVAL(this_opt, name);
> -	i =3D 0;
> -	while (p[i] && p[i] !=3D ' ' && p[i] !=3D ',')
> -		i++;
> -	ret =3D kmalloc(i + 1, GFP_KERNEL);
> -	if (ret) {
> -		strncpy(ret, p, i);
> -		ret[i] =3D '\0';
> -	}
> -	return ret;
> -}
> -
> -static __inline__ int get_opt_int(const char *this_opt, const char *name,
> -				  int *ret)
> -{
> -	if (!ret)
> -		return 0;
> -
> -	if (!OPT_EQUAL(this_opt, name))
> -		return 0;
> -
> -	*ret =3D OPT_INTVAL(this_opt, name);
> -	return 1;
> -}
> -
> -static __inline__ int get_opt_bool(const char *this_opt, const char *nam=
e,
> -				   bool *ret)
> -{
> -	if (!ret)
> -		return 0;
> -
> -	if (OPT_EQUAL(this_opt, name)) {
> -		if (this_opt[strlen(name)] =3D=3D '=3D')
> -			*ret =3D simple_strtoul(this_opt + strlen(name) + 1,
> -					      NULL, 0);
> -		else
> -			*ret =3D 1;
> -	} else {
> -		if (OPT_EQUAL(this_opt, "no") && OPT_EQUAL(this_opt + 2, name))
> -			*ret =3D 0;
> -		else
> -			return 0;
> -	}
> -	return 1;
> -}
> -
> -static int __init intelfb_setup(char *options)
> -{
> -	char *this_opt;
> -
> -	DBG_MSG("intelfb_setup\n");
> -
> -	if (!options || !*options) {
> -		DBG_MSG("no options\n");
> -		return 0;
> -	} else
> -		DBG_MSG("options: %s\n", options);
> -
> -	/*
> -	 * These are the built-in options analogous to the module parameters
> -	 * defined above.
> -	 *
> -	 * The syntax is:
> -	 *
> -	 *    video=3Dintelfb:[mode][,<param>=3D<val>] ...
> -	 *
> -	 * e.g.,
> -	 *
> -	 *    video=3Dintelfb:1024x768-16@75,accel=3D0
> -	 */
> -
> -	while ((this_opt =3D strsep(&options, ","))) {
> -		if (!*this_opt)
> -			continue;
> -		if (get_opt_bool(this_opt, "accel", &accel))
> -			;
> -		else if (get_opt_int(this_opt, "vram", &vram))
> -			;
> -		else if (get_opt_bool(this_opt, "hwcursor", &hwcursor))
> -			;
> -		else if (get_opt_bool(this_opt, "mtrr", &mtrr))
> -			;
> -		else if (get_opt_bool(this_opt, "fixed", &fixed))
> -			;
> -		else if (get_opt_bool(this_opt, "init", &noinit))
> -			noinit =3D !noinit;
> -		else if (OPT_EQUAL(this_opt, "mode=3D"))
> -			mode =3D get_opt_string(this_opt, "mode=3D");
> -		else
> -			mode =3D this_opt;
> -	}
> -
> -	return 0;
> -}
> -
> -#endif
> -
> -static int __init intelfb_init(void)
> -{
> -#ifndef MODULE
> -	char *option =3D NULL;
> -#endif
> -
> -	DBG_MSG("intelfb_init\n");
> -
> -	INF_MSG("Framebuffer driver for "
> -		"Intel(R) " SUPPORTED_CHIPSETS " chipsets\n");
> -	INF_MSG("Version " INTELFB_VERSION "\n");
> -
> -	if (idonly)
> -		return -ENODEV;
> -
> -	if (fb_modesetting_disabled("intelfb"))
> -		return -ENODEV;
> -
> -#ifndef MODULE
> -	if (fb_get_options("intelfb", &option))
> -		return -ENODEV;
> -	intelfb_setup(option);
> -#endif
> -
> -	return pci_register_driver(&intelfb_driver);
> -}
> -
> -static void __exit intelfb_exit(void)
> -{
> -	DBG_MSG("intelfb_exit\n");
> -	pci_unregister_driver(&intelfb_driver);
> -}
> -
> -module_init(intelfb_init);
> -module_exit(intelfb_exit);
> -
> -/***************************************************************
> - *                        driver init / cleanup                *
> - ***************************************************************/
> -
> -static void cleanup(struct intelfb_info *dinfo)
> -{
> -	DBG_MSG("cleanup\n");
> -
> -	if (!dinfo)
> -		return;
> -
> -	intelfbhw_disable_irq(dinfo);
> -
> -	fb_dealloc_cmap(&dinfo->info->cmap);
> -	kfree(dinfo->info->pixmap.addr);
> -
> -	if (dinfo->registered)
> -		unregister_framebuffer(dinfo->info);
> -
> -	arch_phys_wc_del(dinfo->wc_cookie);
> -
> -	if (dinfo->fbmem_gart && dinfo->gtt_fb_mem) {
> -		agp_unbind_memory(dinfo->gtt_fb_mem);
> -		agp_free_memory(dinfo->gtt_fb_mem);
> -	}
> -	if (dinfo->gtt_cursor_mem) {
> -		agp_unbind_memory(dinfo->gtt_cursor_mem);
> -		agp_free_memory(dinfo->gtt_cursor_mem);
> -	}
> -	if (dinfo->gtt_ring_mem) {
> -		agp_unbind_memory(dinfo->gtt_ring_mem);
> -		agp_free_memory(dinfo->gtt_ring_mem);
> -	}
> -
> -#ifdef CONFIG_FB_INTEL_I2C
> -	/* un-register I2C bus */
> -	intelfb_delete_i2c_busses(dinfo);
> -#endif
> -
> -	if (dinfo->mmio_base)
> -		iounmap((void __iomem *)dinfo->mmio_base);
> -	if (dinfo->aperture.virtual)
> -		iounmap((void __iomem *)dinfo->aperture.virtual);
> -
> -	if (dinfo->flag & INTELFB_MMIO_ACQUIRED)
> -		release_mem_region(dinfo->mmio_base_phys, INTEL_REG_SIZE);
> -	if (dinfo->flag & INTELFB_FB_ACQUIRED)
> -		release_mem_region(dinfo->aperture.physical,
> -				   dinfo->aperture.size);
> -	framebuffer_release(dinfo->info);
> -}
> -
> -#define bailout(dinfo) do {						\
> -	DBG_MSG("bailout\n");						\
> -	cleanup(dinfo);							\
> -	INF_MSG("Not going to register framebuffer, exiting...\n");	\
> -	return -ENODEV;							\
> -} while (0)
> -
> -
> -static int intelfb_pci_register(struct pci_dev *pdev,
> -				const struct pci_device_id *ent)
> -{
> -	struct fb_info *info;
> -	struct intelfb_info *dinfo;
> -	int i, err, dvo;
> -	int aperture_size, stolen_size =3D 0;
> -	struct agp_kern_info gtt_info;
> -	int agp_memtype;
> -	const char *s;
> -	struct agp_bridge_data *bridge;
> -	int aperture_bar =3D 0;
> -	int mmio_bar =3D 1;
> -	int offset;
> -
> -	DBG_MSG("intelfb_pci_register\n");
> -
> -	err =3D aperture_remove_conflicting_pci_devices(pdev, "intelfb");
> -	if (err)
> -		return err;
> -
> -	num_registered++;
> -	if (num_registered !=3D 1) {
> -		ERR_MSG("Attempted to register %d devices "
> -			"(should be only 1).\n", num_registered);
> -		return -ENODEV;
> -	}
> -
> -	info =3D framebuffer_alloc(sizeof(struct intelfb_info), &pdev->dev);
> -	if (!info)
> -		return -ENOMEM;
> -
> -	if (fb_alloc_cmap(&info->cmap, 256, 1) < 0) {
> -		ERR_MSG("Could not allocate cmap for intelfb_info.\n");
> -		goto err_out_cmap;
> -	}
> -
> -	dinfo =3D info->par;
> -	dinfo->info  =3D info;
> -	dinfo->fbops =3D &intel_fb_ops;
> -	dinfo->pdev  =3D pdev;
> -
> -	/* Reserve pixmap space. */
> -	info->pixmap.addr =3D kzalloc(64 * 1024, GFP_KERNEL);
> -	if (info->pixmap.addr =3D=3D NULL) {
> -		ERR_MSG("Cannot reserve pixmap memory.\n");
> -		goto err_out_pixmap;
> -	}
> -
> -	/* set early this option because it could be changed by tv encoder
> -	   driver */
> -	dinfo->fixed_mode =3D fixed;
> -
> -	/* Enable device. */
> -	if ((err =3D pci_enable_device(pdev))) {
> -		ERR_MSG("Cannot enable device.\n");
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	/* Set base addresses. */
> -	if ((ent->device =3D=3D PCI_DEVICE_ID_INTEL_915G) ||
> -	    (ent->device =3D=3D PCI_DEVICE_ID_INTEL_915GM) ||
> -	    (ent->device =3D=3D PCI_DEVICE_ID_INTEL_945G)  ||
> -	    (ent->device =3D=3D PCI_DEVICE_ID_INTEL_945GM) ||
> -	    (ent->device =3D=3D PCI_DEVICE_ID_INTEL_945GME) ||
> -	    (ent->device =3D=3D PCI_DEVICE_ID_INTEL_965G) ||
> -	    (ent->device =3D=3D PCI_DEVICE_ID_INTEL_965GM)) {
> -
> -		aperture_bar =3D 2;
> -		mmio_bar =3D 0;
> -	}
> -	dinfo->aperture.physical =3D pci_resource_start(pdev, aperture_bar);
> -	dinfo->aperture.size     =3D pci_resource_len(pdev, aperture_bar);
> -	dinfo->mmio_base_phys    =3D pci_resource_start(pdev, mmio_bar);
> -	DBG_MSG("fb aperture: 0x%llx/0x%llx, MMIO region: 0x%llx/0x%llx\n",
> -		(unsigned long long)pci_resource_start(pdev, aperture_bar),
> -		(unsigned long long)pci_resource_len(pdev, aperture_bar),
> -		(unsigned long long)pci_resource_start(pdev, mmio_bar),
> -		(unsigned long long)pci_resource_len(pdev, mmio_bar));
> -
> -	/* Reserve the fb and MMIO regions */
> -	if (!request_mem_region(dinfo->aperture.physical, dinfo->aperture.size,
> -				INTELFB_MODULE_NAME)) {
> -		ERR_MSG("Cannot reserve FB region.\n");
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	dinfo->flag |=3D INTELFB_FB_ACQUIRED;
> -
> -	if (!request_mem_region(dinfo->mmio_base_phys,
> -				INTEL_REG_SIZE,
> -				INTELFB_MODULE_NAME)) {
> -		ERR_MSG("Cannot reserve MMIO region.\n");
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	dinfo->flag |=3D INTELFB_MMIO_ACQUIRED;
> -
> -	/* Get the chipset info. */
> -	dinfo->pci_chipset =3D pdev->device;
> -
> -	if (intelfbhw_get_chipset(pdev, dinfo)) {
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	if (intelfbhw_get_memory(pdev, &aperture_size, &stolen_size)) {
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	INF_MSG("%02x:%02x.%d: %s, aperture size %dMB, "
> -		"stolen memory %dkB\n",
> -		pdev->bus->number, PCI_SLOT(pdev->devfn),
> -		PCI_FUNC(pdev->devfn), dinfo->name,
> -		BtoMB(aperture_size), BtoKB(stolen_size));
> -
> -	/* Set these from the options. */
> -	dinfo->accel    =3D accel;
> -	dinfo->hwcursor =3D hwcursor;
> -
> -	if (NOACCEL_CHIPSET(dinfo) && dinfo->accel =3D=3D 1) {
> -		INF_MSG("Acceleration is not supported for the %s chipset.\n",
> -			dinfo->name);
> -		dinfo->accel =3D 0;
> -	}
> -
> -	/* Framebuffer parameters - Use all the stolen memory if >=3D vram */
> -	if (ROUND_UP_TO_PAGE(stolen_size) >=3D MB(vram)) {
> -		dinfo->fb.size =3D ROUND_UP_TO_PAGE(stolen_size);
> -		dinfo->fbmem_gart =3D 0;
> -	} else {
> -		dinfo->fb.size =3D  MB(vram);
> -		dinfo->fbmem_gart =3D 1;
> -	}
> -
> -	/* Allocate space for the ring buffer and HW cursor if enabled. */
> -	if (dinfo->accel) {
> -		dinfo->ring.size =3D RINGBUFFER_SIZE;
> -		dinfo->ring_tail_mask =3D dinfo->ring.size - 1;
> -	}
> -	if (dinfo->hwcursor)
> -		dinfo->cursor.size =3D HW_CURSOR_SIZE;
> -
> -	/* Use agpgart to manage the GATT */
> -	if (!(bridge =3D agp_backend_acquire(pdev))) {
> -		ERR_MSG("cannot acquire agp\n");
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	/* get the current gatt info */
> -	if (agp_copy_info(bridge, &gtt_info)) {
> -		ERR_MSG("cannot get agp info\n");
> -		agp_backend_release(bridge);
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	if (MB(voffset) < stolen_size)
> -		offset =3D (stolen_size >> 12);
> -	else
> -		offset =3D ROUND_UP_TO_PAGE(MB(voffset))/GTT_PAGE_SIZE;
> -
> -	/* set the mem offsets - set them after the already used pages */
> -	if (dinfo->accel)
> -		dinfo->ring.offset =3D offset + gtt_info.current_memory;
> -	if (dinfo->hwcursor)
> -		dinfo->cursor.offset =3D offset +
> -			+ gtt_info.current_memory + (dinfo->ring.size >> 12);
> -	if (dinfo->fbmem_gart)
> -		dinfo->fb.offset =3D offset +
> -			+ gtt_info.current_memory + (dinfo->ring.size >> 12)
> -			+ (dinfo->cursor.size >> 12);
> -
> -	/* Allocate memories (which aren't stolen) */
> -	/* Map the fb and MMIO regions */
> -	/* ioremap only up to the end of used aperture */
> -	dinfo->aperture.virtual =3D (u8 __iomem *)ioremap_wc
> -		(dinfo->aperture.physical, ((offset + dinfo->fb.offset) << 12)
> -		 + dinfo->fb.size);
> -	if (!dinfo->aperture.virtual) {
> -		ERR_MSG("Cannot remap FB region.\n");
> -		agp_backend_release(bridge);
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	dinfo->mmio_base =3D
> -		(u8 __iomem *)ioremap(dinfo->mmio_base_phys,
> -					      INTEL_REG_SIZE);
> -	if (!dinfo->mmio_base) {
> -		ERR_MSG("Cannot remap MMIO region.\n");
> -		agp_backend_release(bridge);
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	if (dinfo->accel) {
> -		if (!(dinfo->gtt_ring_mem =3D
> -		      agp_allocate_memory(bridge, dinfo->ring.size >> 12,
> -					  AGP_NORMAL_MEMORY))) {
> -			ERR_MSG("cannot allocate ring buffer memory\n");
> -			agp_backend_release(bridge);
> -			cleanup(dinfo);
> -			return -ENOMEM;
> -		}
> -		if (agp_bind_memory(dinfo->gtt_ring_mem,
> -				    dinfo->ring.offset)) {
> -			ERR_MSG("cannot bind ring buffer memory\n");
> -			agp_backend_release(bridge);
> -			cleanup(dinfo);
> -			return -EBUSY;
> -		}
> -		dinfo->ring.physical =3D dinfo->aperture.physical
> -			+ (dinfo->ring.offset << 12);
> -		dinfo->ring.virtual  =3D dinfo->aperture.virtual
> -			+ (dinfo->ring.offset << 12);
> -		dinfo->ring_head =3D 0;
> -	}
> -	if (dinfo->hwcursor) {
> -		agp_memtype =3D dinfo->mobile ? AGP_PHYSICAL_MEMORY
> -			: AGP_NORMAL_MEMORY;
> -		if (!(dinfo->gtt_cursor_mem =3D
> -		      agp_allocate_memory(bridge, dinfo->cursor.size >> 12,
> -					  agp_memtype))) {
> -			ERR_MSG("cannot allocate cursor memory\n");
> -			agp_backend_release(bridge);
> -			cleanup(dinfo);
> -			return -ENOMEM;
> -		}
> -		if (agp_bind_memory(dinfo->gtt_cursor_mem,
> -				    dinfo->cursor.offset)) {
> -			ERR_MSG("cannot bind cursor memory\n");
> -			agp_backend_release(bridge);
> -			cleanup(dinfo);
> -			return -EBUSY;
> -		}
> -		if (dinfo->mobile)
> -			dinfo->cursor.physical
> -				=3D dinfo->gtt_cursor_mem->physical;
> -		else
> -			dinfo->cursor.physical =3D dinfo->aperture.physical
> -				+ (dinfo->cursor.offset << 12);
> -		dinfo->cursor.virtual =3D dinfo->aperture.virtual
> -			+ (dinfo->cursor.offset << 12);
> -	}
> -	if (dinfo->fbmem_gart) {
> -		if (!(dinfo->gtt_fb_mem =3D
> -		      agp_allocate_memory(bridge, dinfo->fb.size >> 12,
> -					  AGP_NORMAL_MEMORY))) {
> -			WRN_MSG("cannot allocate framebuffer memory - use "
> -				"the stolen one\n");
> -			dinfo->fbmem_gart =3D 0;
> -		}
> -		if (agp_bind_memory(dinfo->gtt_fb_mem,
> -				    dinfo->fb.offset)) {
> -			WRN_MSG("cannot bind framebuffer memory - use "
> -				"the stolen one\n");
> -			dinfo->fbmem_gart =3D 0;
> -		}
> -	}
> -
> -	/* update framebuffer memory parameters */
> -	if (!dinfo->fbmem_gart)
> -		dinfo->fb.offset =3D 0;   /* starts at offset 0 */
> -	dinfo->fb.physical =3D dinfo->aperture.physical
> -		+ (dinfo->fb.offset << 12);
> -	dinfo->fb.virtual =3D dinfo->aperture.virtual + (dinfo->fb.offset << 12=
);
> -	dinfo->fb_start =3D dinfo->fb.offset << 12;
> -
> -	/* release agpgart */
> -	agp_backend_release(bridge);
> -
> -	if (mtrr)
> -		dinfo->wc_cookie =3D arch_phys_wc_add(dinfo->aperture.physical,
> -						    dinfo->aperture.size);
> -
> -	DBG_MSG("fb: 0x%x(+ 0x%x)/0x%x (0x%p)\n",
> -		dinfo->fb.physical, dinfo->fb.offset, dinfo->fb.size,
> -		dinfo->fb.virtual);
> -	DBG_MSG("MMIO: 0x%x/0x%x (0x%p)\n",
> -		dinfo->mmio_base_phys, INTEL_REG_SIZE,
> -		dinfo->mmio_base);
> -	DBG_MSG("ring buffer: 0x%x/0x%x (0x%p)\n",
> -		dinfo->ring.physical, dinfo->ring.size,
> -		dinfo->ring.virtual);
> -	DBG_MSG("HW cursor: 0x%x/0x%x (0x%p) (offset 0x%x) (phys 0x%x)\n",
> -		dinfo->cursor.physical, dinfo->cursor.size,
> -		dinfo->cursor.virtual, dinfo->cursor.offset,
> -		dinfo->cursor.physical);
> -
> -	DBG_MSG("options: vram =3D %d, accel =3D %d, hwcursor =3D %d, fixed =3D=
 %d, "
> -		"noinit =3D %d\n", vram, accel, hwcursor, fixed, noinit);
> -	DBG_MSG("options: mode =3D \"%s\"\n", mode ? mode : "");
> -
> -	if (probeonly)
> -		bailout(dinfo);
> -
> -	/*
> -	 * Check if the LVDS port or any DVO ports are enabled.  If so,
> -	 * don't allow mode switching
> -	 */
> -	dvo =3D intelfbhw_check_non_crt(dinfo);
> -	if (dvo) {
> -		dinfo->fixed_mode =3D 1;
> -		WRN_MSG("Non-CRT device is enabled ( ");
> -		i =3D 0;
> -		while (dvo) {
> -			if (dvo & 1) {
> -				s =3D intelfbhw_dvo_to_string(1 << i);
> -				if (s)
> -					printk("%s ", s);
> -			}
> -			dvo >>=3D 1;
> -			++i;
> -		}
> -		printk(").  Disabling mode switching.\n");
> -	}
> -
> -	if (bailearly =3D=3D 1)
> -		bailout(dinfo);
> -
> -	if (FIXED_MODE(dinfo) &&
> -	    screen_info.orig_video_isVGA !=3D VIDEO_TYPE_VLFB) {
> -		ERR_MSG("Video mode must be programmed at boot time.\n");
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	if (bailearly =3D=3D 2)
> -		bailout(dinfo);
> -
> -	/* Initialise dinfo and related data. */
> -	/* If an initial mode was programmed at boot time, get its details. */
> -	if (screen_info.orig_video_isVGA =3D=3D VIDEO_TYPE_VLFB)
> -		get_initial_mode(dinfo);
> -
> -	if (bailearly =3D=3D 3)
> -		bailout(dinfo);
> -
> -	if (FIXED_MODE(dinfo))	/* remap fb address */
> -		update_dinfo(dinfo, &dinfo->initial_var);
> -
> -	if (bailearly =3D=3D 4)
> -		bailout(dinfo);
> -
> -
> -	if (intelfb_set_fbinfo(dinfo)) {
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	if (bailearly =3D=3D 5)
> -		bailout(dinfo);
> -
> -#ifdef CONFIG_FB_INTEL_I2C
> -	/* register I2C bus */
> -	intelfb_create_i2c_busses(dinfo);
> -#endif
> -
> -	if (bailearly =3D=3D 6)
> -		bailout(dinfo);
> -
> -	pci_set_drvdata(pdev, dinfo);
> -
> -	/* Save the initial register state. */
> -	i =3D intelfbhw_read_hw_state(dinfo, &dinfo->save_state,
> -				    bailearly > 6 ? bailearly - 6 : 0);
> -	if (i !=3D 0) {
> -		DBG_MSG("intelfbhw_read_hw_state returned %d\n", i);
> -		bailout(dinfo);
> -	}
> -
> -	intelfbhw_print_hw_state(dinfo, &dinfo->save_state);
> -
> -	if (bailearly =3D=3D 18)
> -		bailout(dinfo);
> -
> -	/* read active pipe */
> -	dinfo->pipe =3D intelfbhw_active_pipe(&dinfo->save_state);
> -
> -	/* Cursor initialisation */
> -	if (dinfo->hwcursor) {
> -		intelfbhw_cursor_init(dinfo);
> -		intelfbhw_cursor_reset(dinfo);
> -	}
> -
> -	if (bailearly =3D=3D 19)
> -		bailout(dinfo);
> -
> -	/* 2d acceleration init */
> -	if (dinfo->accel)
> -		intelfbhw_2d_start(dinfo);
> -
> -	if (bailearly =3D=3D 20)
> -		bailout(dinfo);
> -
> -	if (noregister)
> -		bailout(dinfo);
> -
> -	if (register_framebuffer(dinfo->info) < 0) {
> -		ERR_MSG("Cannot register framebuffer.\n");
> -		cleanup(dinfo);
> -		return -ENODEV;
> -	}
> -
> -	dinfo->registered =3D 1;
> -	dinfo->open =3D 0;
> -
> -	init_waitqueue_head(&dinfo->vsync.wait);
> -	spin_lock_init(&dinfo->int_lock);
> -	dinfo->irq_flags =3D 0;
> -	dinfo->vsync.pan_display =3D 0;
> -	dinfo->vsync.pan_offset =3D 0;
> -
> -	return 0;
> -
> -err_out_pixmap:
> -	fb_dealloc_cmap(&info->cmap);
> -err_out_cmap:
> -	framebuffer_release(info);
> -	return -ENODEV;
> -}
> -
> -static void intelfb_pci_unregister(struct pci_dev *pdev)
> -{
> -	struct intelfb_info *dinfo =3D pci_get_drvdata(pdev);
> -
> -	DBG_MSG("intelfb_pci_unregister\n");
> -
> -	if (!dinfo)
> -		return;
> -
> -	cleanup(dinfo);
> -}
> -
> -/***************************************************************
> - *                       helper functions                      *
> - ***************************************************************/
> -
> -__inline__ int intelfb_var_to_depth(const struct fb_var_screeninfo *var)
> -{
> -	DBG_MSG("intelfb_var_to_depth: bpp: %d, green.length is %d\n",
> -		var->bits_per_pixel, var->green.length);
> -
> -	switch (var->bits_per_pixel) {
> -	case 16:
> -		return (var->green.length =3D=3D 6) ? 16 : 15;
> -	case 32:
> -		return 24;
> -	default:
> -		return var->bits_per_pixel;
> -	}
> -}
> -
> -
> -static __inline__ int var_to_refresh(const struct fb_var_screeninfo *var)
> -{
> -	int xtot =3D var->xres + var->left_margin + var->right_margin +
> -		   var->hsync_len;
> -	int ytot =3D var->yres + var->upper_margin + var->lower_margin +
> -		   var->vsync_len;
> -
> -	return (1000000000 / var->pixclock * 1000 + 500) / xtot / ytot;
> -}
> -
> -/***************************************************************
> - *                Various initialisation functions             *
> - ***************************************************************/
> -
> -static void get_initial_mode(struct intelfb_info *dinfo)
> -{
> -	struct fb_var_screeninfo *var;
> -	int xtot, ytot;
> -
> -	DBG_MSG("get_initial_mode\n");
> -
> -	dinfo->initial_vga =3D 1;
> -	dinfo->initial_fb_base =3D screen_info.lfb_base;
> -	dinfo->initial_video_ram =3D screen_info.lfb_size * KB(64);
> -	dinfo->initial_pitch =3D screen_info.lfb_linelength;
> -
> -	var =3D &dinfo->initial_var;
> -	memset(var, 0, sizeof(*var));
> -	var->xres =3D screen_info.lfb_width;
> -	var->yres =3D screen_info.lfb_height;
> -	var->bits_per_pixel =3D screen_info.lfb_depth;
> -	switch (screen_info.lfb_depth) {
> -	case 15:
> -		var->bits_per_pixel =3D 16;
> -		break;
> -	case 24:
> -		var->bits_per_pixel =3D 32;
> -		break;
> -	}
> -
> -	DBG_MSG("Initial info: FB is 0x%x/0x%x (%d kByte)\n",
> -		dinfo->initial_fb_base, dinfo->initial_video_ram,
> -		BtoKB(dinfo->initial_video_ram));
> -
> -	DBG_MSG("Initial info: mode is %dx%d-%d (%d)\n",
> -		var->xres, var->yres, var->bits_per_pixel,
> -		dinfo->initial_pitch);
> -
> -	/* Dummy timing values (assume 60Hz) */
> -	var->left_margin =3D (var->xres / 8) & 0xf8;
> -	var->right_margin =3D 32;
> -	var->upper_margin =3D 16;
> -	var->lower_margin =3D 4;
> -	var->hsync_len =3D (var->xres / 8) & 0xf8;
> -	var->vsync_len =3D 4;
> -
> -	xtot =3D var->xres + var->left_margin +
> -		var->right_margin + var->hsync_len;
> -	ytot =3D var->yres + var->upper_margin +
> -		var->lower_margin + var->vsync_len;
> -	var->pixclock =3D 10000000 / xtot * 1000 / ytot * 100 / 60;
> -
> -	var->height =3D -1;
> -	var->width =3D -1;
> -
> -	if (var->bits_per_pixel > 8) {
> -		var->red.offset =3D screen_info.red_pos;
> -		var->red.length =3D screen_info.red_size;
> -		var->green.offset =3D screen_info.green_pos;
> -		var->green.length =3D screen_info.green_size;
> -		var->blue.offset =3D screen_info.blue_pos;
> -		var->blue.length =3D screen_info.blue_size;
> -		var->transp.offset =3D screen_info.rsvd_pos;
> -		var->transp.length =3D screen_info.rsvd_size;
> -	} else {
> -		var->red.length =3D 8;
> -		var->green.length =3D 8;
> -		var->blue.length =3D 8;
> -	}
> -}
> -
> -static int intelfb_init_var(struct intelfb_info *dinfo)
> -{
> -	struct fb_var_screeninfo *var;
> -	int msrc =3D 0;
> -
> -	DBG_MSG("intelfb_init_var\n");
> -
> -	var =3D &dinfo->info->var;
> -	if (FIXED_MODE(dinfo)) {
> -	        memcpy(var, &dinfo->initial_var,
> -		       sizeof(struct fb_var_screeninfo));
> -		msrc =3D 5;
> -	} else {
> -		const u8 *edid_s =3D fb_firmware_edid(&dinfo->pdev->dev);
> -		u8 *edid_d =3D NULL;
> -
> -		if (edid_s) {
> -			edid_d =3D kmemdup(edid_s, EDID_LENGTH, GFP_KERNEL);
> -
> -			if (edid_d) {
> -				fb_edid_to_monspecs(edid_d,
> -						    &dinfo->info->monspecs);
> -				kfree(edid_d);
> -			}
> -		}
> -
> -		if (mode) {
> -			printk("intelfb: Looking for mode in private "
> -			       "database\n");
> -			msrc =3D fb_find_mode(var, dinfo->info, mode,
> -					    dinfo->info->monspecs.modedb,
> -					    dinfo->info->monspecs.modedb_len,
> -					    NULL, 0);
> -
> -			if (msrc && msrc > 1) {
> -				printk("intelfb: No mode in private database, "
> -				       "intelfb: looking for mode in global "
> -				       "database ");
> -				msrc =3D fb_find_mode(var, dinfo->info, mode,
> -						    NULL, 0, NULL, 0);
> -
> -				if (msrc)
> -					msrc |=3D 8;
> -			}
> -
> -		}
> -
> -		if (!msrc)
> -			msrc =3D fb_find_mode(var, dinfo->info, PREFERRED_MODE,
> -					    NULL, 0, NULL, 0);
> -	}
> -
> -	if (!msrc) {
> -		ERR_MSG("Cannot find a suitable video mode.\n");
> -		return 1;
> -	}
> -
> -	INF_MSG("Initial video mode is %dx%d-%d@%d.\n", var->xres, var->yres,
> -		var->bits_per_pixel, var_to_refresh(var));
> -
> -	DBG_MSG("Initial video mode is from %d.\n", msrc);
> -
> -#if ALLOCATE_FOR_PANNING
> -	/* Allow use of half of the video ram for panning */
> -	var->xres_virtual =3D var->xres;
> -	var->yres_virtual =3D
> -		dinfo->fb.size / 2 / (var->bits_per_pixel * var->xres);
> -	if (var->yres_virtual < var->yres)
> -		var->yres_virtual =3D var->yres;
> -#else
> -	var->yres_virtual =3D var->yres;
> -#endif
> -
> -	if (dinfo->accel)
> -		var->accel_flags |=3D FB_ACCELF_TEXT;
> -	else
> -		var->accel_flags &=3D ~FB_ACCELF_TEXT;
> -
> -	return 0;
> -}
> -
> -static int intelfb_set_fbinfo(struct intelfb_info *dinfo)
> -{
> -	struct fb_info *info =3D dinfo->info;
> -
> -	DBG_MSG("intelfb_set_fbinfo\n");
> -
> -	info->fbops =3D &intel_fb_ops;
> -	info->pseudo_palette =3D dinfo->pseudo_palette;
> -
> -	info->pixmap.size =3D 64*1024;
> -	info->pixmap.buf_align =3D 8;
> -	info->pixmap.access_align =3D 32;
> -	info->pixmap.flags =3D FB_PIXMAP_SYSTEM;
> -
> -	if (intelfb_init_var(dinfo))
> -		return 1;
> -
> -	info->pixmap.scan_align =3D 1;
> -	strcpy(info->fix.id, dinfo->name);
> -	info->fix.smem_start =3D dinfo->fb.physical;
> -	info->fix.smem_len =3D dinfo->fb.size;
> -	info->fix.type =3D FB_TYPE_PACKED_PIXELS;
> -	info->fix.type_aux =3D 0;
> -	info->fix.xpanstep =3D 8;
> -	info->fix.ypanstep =3D 1;
> -	info->fix.ywrapstep =3D 0;
> -	info->fix.mmio_start =3D dinfo->mmio_base_phys;
> -	info->fix.mmio_len =3D INTEL_REG_SIZE;
> -	info->fix.accel =3D FB_ACCEL_I830;
> -	update_dinfo(dinfo, &info->var);
> -
> -	return 0;
> -}
> -
> -/* Update dinfo to match the active video mode. */
> -static void update_dinfo(struct intelfb_info *dinfo,
> -			 struct fb_var_screeninfo *var)
> -{
> -	DBG_MSG("update_dinfo\n");
> -
> -	dinfo->bpp =3D var->bits_per_pixel;
> -	dinfo->depth =3D intelfb_var_to_depth(var);
> -	dinfo->xres =3D var->xres;
> -	dinfo->yres =3D var->xres;
> -	dinfo->pixclock =3D var->pixclock;
> -
> -	dinfo->info->fix.visual =3D dinfo->visual;
> -	dinfo->info->fix.line_length =3D dinfo->pitch;
> -
> -	switch (dinfo->bpp) {
> -	case 8:
> -		dinfo->visual =3D FB_VISUAL_PSEUDOCOLOR;
> -		dinfo->pitch =3D var->xres_virtual;
> -		break;
> -	case 16:
> -		dinfo->visual =3D FB_VISUAL_TRUECOLOR;
> -		dinfo->pitch =3D var->xres_virtual * 2;
> -		break;
> -	case 32:
> -		dinfo->visual =3D FB_VISUAL_TRUECOLOR;
> -		dinfo->pitch =3D var->xres_virtual * 4;
> -		break;
> -	}
> -
> -	/* Make sure the line length is a aligned correctly. */
> -	if (IS_I9XX(dinfo))
> -		dinfo->pitch =3D ROUND_UP_TO(dinfo->pitch, STRIDE_ALIGNMENT_I9XX);
> -	else
> -		dinfo->pitch =3D ROUND_UP_TO(dinfo->pitch, STRIDE_ALIGNMENT);
> -
> -	if (FIXED_MODE(dinfo))
> -		dinfo->pitch =3D dinfo->initial_pitch;
> -
> -	dinfo->info->screen_base =3D (char __iomem *)dinfo->fb.virtual;
> -	dinfo->info->fix.line_length =3D dinfo->pitch;
> -	dinfo->info->fix.visual =3D dinfo->visual;
> -}
> -
> -/* fbops functions */
> -
> -/***************************************************************
> - *                       fbdev interface                       *
> - ***************************************************************/
> -
> -static int intelfb_open(struct fb_info *info, int user)
> -{
> -	struct intelfb_info *dinfo =3D GET_DINFO(info);
> -
> -	if (user)
> -		dinfo->open++;
> -
> -	return 0;
> -}
> -
> -static int intelfb_release(struct fb_info *info, int user)
> -{
> -	struct intelfb_info *dinfo =3D GET_DINFO(info);
> -
> -	if (user) {
> -		dinfo->open--;
> -		msleep(1);
> -		if (!dinfo->open)
> -			intelfbhw_disable_irq(dinfo);
> -	}
> -
> -	return 0;
> -}
> -
> -static int intelfb_check_var(struct fb_var_screeninfo *var,
> -			     struct fb_info *info)
> -{
> -	int change_var =3D 0;
> -	struct fb_var_screeninfo v;
> -	struct intelfb_info *dinfo;
> -	static int first =3D 1;
> -	int i;
> -	/* Good pitches to allow tiling.  Don't care about pitches < 1024. */
> -	static const int pitches[] =3D {
> -		128 * 8,
> -		128 * 16,
> -		128 * 32,
> -		128 * 64,
> -		0
> -	};
> -
> -	DBG_MSG("intelfb_check_var: accel_flags is %d\n", var->accel_flags);
> -
> -	dinfo =3D GET_DINFO(info);
> -
> -	if (!var->pixclock)
> -		return -EINVAL;
> -
> -	/* update the pitch */
> -	if (intelfbhw_validate_mode(dinfo, var) !=3D 0)
> -		return -EINVAL;
> -
> -	v =3D *var;
> -
> -	for (i =3D 0; pitches[i] !=3D 0; i++) {
> -		if (pitches[i] >=3D v.xres_virtual) {
> -			v.xres_virtual =3D pitches[i];
> -			break;
> -		}
> -	}
> -
> -	/* Check for a supported bpp. */
> -	if (v.bits_per_pixel <=3D 8)
> -		v.bits_per_pixel =3D 8;
> -	else if (v.bits_per_pixel <=3D 16) {
> -		if (v.bits_per_pixel =3D=3D 16)
> -			v.green.length =3D 6;
> -		v.bits_per_pixel =3D 16;
> -	} else if (v.bits_per_pixel <=3D 32)
> -		v.bits_per_pixel =3D 32;
> -	else
> -		return -EINVAL;
> -
> -	change_var =3D ((info->var.xres !=3D var->xres) ||
> -		      (info->var.yres !=3D var->yres) ||
> -		      (info->var.xres_virtual !=3D var->xres_virtual) ||
> -		      (info->var.yres_virtual !=3D var->yres_virtual) ||
> -		      (info->var.bits_per_pixel !=3D var->bits_per_pixel) ||
> -		      memcmp(&info->var.red, &var->red, sizeof(var->red)) ||
> -		      memcmp(&info->var.green, &var->green,
> -			     sizeof(var->green)) ||
> -		      memcmp(&info->var.blue, &var->blue, sizeof(var->blue)));
> -
> -	if (FIXED_MODE(dinfo) &&
> -	    (change_var ||
> -	     var->yres_virtual > dinfo->initial_var.yres_virtual ||
> -	     var->yres_virtual < dinfo->initial_var.yres ||
> -	     var->xoffset || var->nonstd)) {
> -		if (first) {
> -			ERR_MSG("Changing the video mode is not supported.\n");
> -			first =3D 0;
> -		}
> -		return -EINVAL;
> -	}
> -
> -	switch (intelfb_var_to_depth(&v)) {
> -	case 8:
> -		v.red.offset =3D v.green.offset =3D v.blue.offset =3D 0;
> -		v.red.length =3D v.green.length =3D v.blue.length =3D 8;
> -		v.transp.offset =3D v.transp.length =3D 0;
> -		break;
> -	case 15:
> -		v.red.offset =3D 10;
> -		v.green.offset =3D 5;
> -		v.blue.offset =3D 0;
> -		v.red.length =3D v.green.length =3D v.blue.length =3D 5;
> -		v.transp.offset =3D v.transp.length =3D 0;
> -		break;
> -	case 16:
> -		v.red.offset =3D 11;
> -		v.green.offset =3D 5;
> -		v.blue.offset =3D 0;
> -		v.red.length =3D 5;
> -		v.green.length =3D 6;
> -		v.blue.length =3D 5;
> -		v.transp.offset =3D v.transp.length =3D 0;
> -		break;
> -	case 24:
> -		v.red.offset =3D 16;
> -		v.green.offset =3D 8;
> -		v.blue.offset =3D 0;
> -		v.red.length =3D v.green.length =3D v.blue.length =3D 8;
> -		v.transp.offset =3D v.transp.length =3D 0;
> -		break;
> -	case 32:
> -		v.red.offset =3D 16;
> -		v.green.offset =3D 8;
> -		v.blue.offset =3D 0;
> -		v.red.length =3D v.green.length =3D v.blue.length =3D 8;
> -		v.transp.offset =3D 24;
> -		v.transp.length =3D 8;
> -		break;
> -	}
> -
> -	if (v.xoffset > v.xres_virtual - v.xres)
> -		v.xoffset =3D v.xres_virtual - v.xres;
> -	if (v.yoffset > v.yres_virtual - v.yres)
> -		v.yoffset =3D v.yres_virtual - v.yres;
> -
> -	v.red.msb_right =3D v.green.msb_right =3D v.blue.msb_right =3D
> -			  v.transp.msb_right =3D 0;
> -
> -        *var =3D v;
> -
> -	return 0;
> -}
> -
> -static int intelfb_set_par(struct fb_info *info)
> -{
> -	struct intelfb_hwstate *hw;
> -        struct intelfb_info *dinfo =3D GET_DINFO(info);
> -
> -	if (FIXED_MODE(dinfo)) {
> -		ERR_MSG("Changing the video mode is not supported.\n");
> -		return -EINVAL;
> -	}
> -
> -	hw =3D kmalloc(sizeof(*hw), GFP_ATOMIC);
> -	if (!hw)
> -		return -ENOMEM;
> -
> -	DBG_MSG("intelfb_set_par (%dx%d-%d)\n", info->var.xres,
> -		info->var.yres, info->var.bits_per_pixel);
> -
> -	/*
> -	 * Disable VCO prior to timing register change.
> -	 */
> -	OUTREG(DPLL_A, INREG(DPLL_A) & ~DPLL_VCO_ENABLE);
> -
> -	intelfb_blank(FB_BLANK_POWERDOWN, info);
> -
> -	if (ACCEL(dinfo, info))
> -		intelfbhw_2d_stop(dinfo);
> -
> -	memcpy(hw, &dinfo->save_state, sizeof(*hw));
> -	if (intelfbhw_mode_to_hw(dinfo, hw, &info->var))
> -		goto invalid_mode;
> -	if (intelfbhw_program_mode(dinfo, hw, 0))
> -		goto invalid_mode;
> -
> -#if REGDUMP > 0
> -	intelfbhw_read_hw_state(dinfo, hw, 0);
> -	intelfbhw_print_hw_state(dinfo, hw);
> -#endif
> -
> -	update_dinfo(dinfo, &info->var);
> -
> -	if (ACCEL(dinfo, info))
> -		intelfbhw_2d_start(dinfo);
> -
> -	intelfb_pan_display(&info->var, info);
> -
> -	intelfb_blank(FB_BLANK_UNBLANK, info);
> -
> -	if (ACCEL(dinfo, info)) {
> -		info->flags =3D FBINFO_HWACCEL_YPAN |
> -		FBINFO_HWACCEL_COPYAREA | FBINFO_HWACCEL_FILLRECT |
> -		FBINFO_HWACCEL_IMAGEBLIT;
> -	} else
> -		info->flags =3D FBINFO_HWACCEL_YPAN;
> -
> -	kfree(hw);
> -	return 0;
> -invalid_mode:
> -	kfree(hw);
> -	return -EINVAL;
> -}
> -
> -static int intelfb_setcolreg(unsigned regno, unsigned red, unsigned gree=
n,
> -			     unsigned blue, unsigned transp,
> -			     struct fb_info *info)
> -{
> -	struct intelfb_info *dinfo =3D GET_DINFO(info);
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfb_setcolreg: regno %d, depth %d\n", regno, dinfo->depth);
> -#endif
> -
> -	if (regno > 255)
> -		return 1;
> -
> -	if (dinfo->depth =3D=3D 8) {
> -		red >>=3D 8;
> -		green >>=3D 8;
> -		blue >>=3D 8;
> -
> -		intelfbhw_setcolreg(dinfo, regno, red, green, blue,
> -				    transp);
> -	}
> -
> -	if (regno < 16) {
> -		switch (dinfo->depth) {
> -		case 15:
> -			dinfo->pseudo_palette[regno] =3D ((red & 0xf800) >>  1) |
> -				((green & 0xf800) >>  6) |
> -				((blue & 0xf800) >> 11);
> -			break;
> -		case 16:
> -			dinfo->pseudo_palette[regno] =3D (red & 0xf800) |
> -				((green & 0xfc00) >>  5) |
> -				((blue  & 0xf800) >> 11);
> -			break;
> -		case 24:
> -			dinfo->pseudo_palette[regno] =3D ((red & 0xff00) << 8) |
> -				(green & 0xff00) |
> -				((blue  & 0xff00) >> 8);
> -			break;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static int intelfb_blank(int blank, struct fb_info *info)
> -{
> -	intelfbhw_do_blank(blank, info);
> -	return 0;
> -}
> -
> -static int intelfb_pan_display(struct fb_var_screeninfo *var,
> -			       struct fb_info *info)
> -{
> -	intelfbhw_pan_display(var, info);
> -	return 0;
> -}
> -
> -/* When/if we have our own ioctls. */
> -static int intelfb_ioctl(struct fb_info *info, unsigned int cmd,
> -			 unsigned long arg)
> -{
> -	int retval =3D 0;
> -	struct intelfb_info *dinfo =3D GET_DINFO(info);
> -	u32 pipe =3D 0;
> -
> -	switch (cmd) {
> -		case FBIO_WAITFORVSYNC:
> -			if (get_user(pipe, (__u32 __user *)arg))
> -				return -EFAULT;
> -
> -			retval =3D intelfbhw_wait_for_vsync(dinfo, pipe);
> -			break;
> -		default:
> -			break;
> -	}
> -
> -	return retval;
> -}
> -
> -static void intelfb_fillrect (struct fb_info *info,
> -			      const struct fb_fillrect *rect)
> -{
> -        struct intelfb_info *dinfo =3D GET_DINFO(info);
> -	u32 rop, color;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfb_fillrect\n");
> -#endif
> -
> -	if (!ACCEL(dinfo, info) || dinfo->depth =3D=3D 4) {
> -		cfb_fillrect(info, rect);
> -		return;
> -	}
> -
> -	if (rect->rop =3D=3D ROP_COPY)
> -		rop =3D PAT_ROP_GXCOPY;
> -	else /* ROP_XOR */
> -		rop =3D PAT_ROP_GXXOR;
> -
> -	if (dinfo->depth !=3D 8)
> -		color =3D dinfo->pseudo_palette[rect->color];
> -	else
> -		color =3D rect->color;
> -
> -	intelfbhw_do_fillrect(dinfo, rect->dx, rect->dy,
> -			      rect->width, rect->height, color,
> -			      dinfo->pitch, info->var.bits_per_pixel,
> -			      rop);
> -}
> -
> -static void intelfb_copyarea(struct fb_info *info,
> -			     const struct fb_copyarea *region)
> -{
> -        struct intelfb_info *dinfo =3D GET_DINFO(info);
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfb_copyarea\n");
> -#endif
> -
> -	if (!ACCEL(dinfo, info) || dinfo->depth =3D=3D 4) {
> -		cfb_copyarea(info, region);
> -		return;
> -	}
> -
> -	intelfbhw_do_bitblt(dinfo, region->sx, region->sy, region->dx,
> -			    region->dy, region->width, region->height,
> -			    dinfo->pitch, info->var.bits_per_pixel);
> -}
> -
> -static void intelfb_imageblit(struct fb_info *info,
> -			      const struct fb_image *image)
> -{
> -        struct intelfb_info *dinfo =3D GET_DINFO(info);
> -	u32 fgcolor, bgcolor;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfb_imageblit\n");
> -#endif
> -
> -	if (!ACCEL(dinfo, info) || dinfo->depth =3D=3D 4
> -	    || image->depth !=3D 1) {
> -		cfb_imageblit(info, image);
> -		return;
> -	}
> -
> -	if (dinfo->depth !=3D 8) {
> -		fgcolor =3D dinfo->pseudo_palette[image->fg_color];
> -		bgcolor =3D dinfo->pseudo_palette[image->bg_color];
> -	} else {
> -		fgcolor =3D image->fg_color;
> -		bgcolor =3D image->bg_color;
> -	}
> -
> -	if (!intelfbhw_do_drawglyph(dinfo, fgcolor, bgcolor, image->width,
> -				    image->height, image->data,
> -				    image->dx, image->dy,
> -				    dinfo->pitch, info->var.bits_per_pixel)) {
> -		cfb_imageblit(info, image);
> -		return;
> -	}
> -}
> -
> -static int intelfb_cursor(struct fb_info *info, struct fb_cursor *cursor)
> -{
> -        struct intelfb_info *dinfo =3D GET_DINFO(info);
> -	u32 physical;
> -#if VERBOSE > 0
> -	DBG_MSG("intelfb_cursor\n");
> -#endif
> -
> -	if (!dinfo->hwcursor)
> -		return -ENODEV;
> -
> -	intelfbhw_cursor_hide(dinfo);
> -
> -	/* If XFree killed the cursor - restore it */
> -	physical =3D (dinfo->mobile || IS_I9XX(dinfo)) ? dinfo->cursor.physical=
 :
> -		   (dinfo->cursor.offset << 12);
> -
> -	if (INREG(CURSOR_A_BASEADDR) !=3D physical) {
> -		u32 fg, bg;
> -
> -		DBG_MSG("the cursor was killed - restore it !!\n");
> -		DBG_MSG("size %d, %d   pos %d, %d\n",
> -			cursor->image.width, cursor->image.height,
> -			cursor->image.dx, cursor->image.dy);
> -
> -		intelfbhw_cursor_init(dinfo);
> -		intelfbhw_cursor_reset(dinfo);
> -		intelfbhw_cursor_setpos(dinfo, cursor->image.dx,
> -					cursor->image.dy);
> -
> -		if (dinfo->depth !=3D 8) {
> -			fg =3Ddinfo->pseudo_palette[cursor->image.fg_color];
> -			bg =3Ddinfo->pseudo_palette[cursor->image.bg_color];
> -		} else {
> -			fg =3D cursor->image.fg_color;
> -			bg =3D cursor->image.bg_color;
> -		}
> -		intelfbhw_cursor_setcolor(dinfo, bg, fg);
> -		intelfbhw_cursor_load(dinfo, cursor->image.width,
> -				      cursor->image.height,
> -				      dinfo->cursor_src);
> -
> -		if (cursor->enable)
> -			intelfbhw_cursor_show(dinfo);
> -		return 0;
> -	}
> -
> -	if (cursor->set & FB_CUR_SETPOS) {
> -		u32 dx, dy;
> -
> -		dx =3D cursor->image.dx - info->var.xoffset;
> -		dy =3D cursor->image.dy - info->var.yoffset;
> -
> -		intelfbhw_cursor_setpos(dinfo, dx, dy);
> -	}
> -
> -	if (cursor->set & FB_CUR_SETSIZE) {
> -		if (cursor->image.width > 64 || cursor->image.height > 64)
> -			return -ENXIO;
> -
> -		intelfbhw_cursor_reset(dinfo);
> -	}
> -
> -	if (cursor->set & FB_CUR_SETCMAP) {
> -		u32 fg, bg;
> -
> -		if (dinfo->depth !=3D 8) {
> -			fg =3D dinfo->pseudo_palette[cursor->image.fg_color];
> -			bg =3D dinfo->pseudo_palette[cursor->image.bg_color];
> -		} else {
> -			fg =3D cursor->image.fg_color;
> -			bg =3D cursor->image.bg_color;
> -		}
> -
> -		intelfbhw_cursor_setcolor(dinfo, bg, fg);
> -	}
> -
> -	if (cursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
> -		u32 s_pitch =3D (ROUND_UP_TO(cursor->image.width, 8) / 8);
> -		u32 size =3D s_pitch * cursor->image.height;
> -		u8 *dat =3D (u8 *) cursor->image.data;
> -		u8 *msk =3D (u8 *) cursor->mask;
> -		u8 src[64];
> -		u32 i;
> -
> -		if (cursor->image.depth !=3D 1)
> -			return -ENXIO;
> -
> -		switch (cursor->rop) {
> -		case ROP_XOR:
> -			for (i =3D 0; i < size; i++)
> -				src[i] =3D dat[i] ^ msk[i];
> -			break;
> -		case ROP_COPY:
> -		default:
> -			for (i =3D 0; i < size; i++)
> -				src[i] =3D dat[i] & msk[i];
> -			break;
> -		}
> -
> -		/* save the bitmap to restore it when XFree will
> -		   make the cursor dirty */
> -		memcpy(dinfo->cursor_src, src, size);
> -
> -		intelfbhw_cursor_load(dinfo, cursor->image.width,
> -				      cursor->image.height, src);
> -	}
> -
> -	if (cursor->enable)
> -		intelfbhw_cursor_show(dinfo);
> -
> -	return 0;
> -}
> -
> -static int intelfb_sync(struct fb_info *info)
> -{
> -        struct intelfb_info *dinfo =3D GET_DINFO(info);
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfb_sync\n");
> -#endif
> -
> -	if (dinfo->ring_lockup)
> -		return 0;
> -
> -	intelfbhw_do_sync(dinfo);
> -	return 0;
> -}
> -
> diff --git a/drivers/video/fbdev/intelfb/intelfbhw.c b/drivers/video/fbde=
v/intelfb/intelfbhw.c
> deleted file mode 100644
> index 2086e06532ee..000000000000
> --- a/drivers/video/fbdev/intelfb/intelfbhw.c
> +++ /dev/null
> @@ -1,2115 +0,0 @@
> -/*
> - * intelfb
> - *
> - * Linux framebuffer driver for Intel(R) 865G integrated graphics chips.
> - *
> - * Copyright =A9 2002, 2003 David Dawes <dawes@xfree86.org>
> - *                   2004 Sylvain Meyer
> - *
> - * This driver consists of two parts.  The first part (intelfbdrv.c) pro=
vides
> - * the basic fbdev interfaces, is derived in part from the radeonfb and
> - * vesafb drivers, and is covered by the GPL.  The second part (intelfbh=
w.c)
> - * provides the code to program the hardware.  Most of it is derived from
> - * the i810/i830 XFree86 driver.  The HW-specific code is covered here
> - * under a dual license (GPL and MIT/XFree86 license).
> - *
> - * Author: David Dawes
> - *
> - */
> -
> -/* $DHD: intelfb/intelfbhw.c,v 1.9 2003/06/27 15:06:25 dawes Exp $ */
> -
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/errno.h>
> -#include <linux/string.h>
> -#include <linux/mm.h>
> -#include <linux/delay.h>
> -#include <linux/fb.h>
> -#include <linux/ioport.h>
> -#include <linux/init.h>
> -#include <linux/pci.h>
> -#include <linux/vmalloc.h>
> -#include <linux/pagemap.h>
> -#include <linux/interrupt.h>
> -
> -#include <asm/io.h>
> -
> -#include "intelfb.h"
> -#include "intelfbhw.h"
> -
> -struct pll_min_max {
> -	int min_m, max_m, min_m1, max_m1;
> -	int min_m2, max_m2, min_n, max_n;
> -	int min_p, max_p, min_p1, max_p1;
> -	int min_vco, max_vco, p_transition_clk, ref_clk;
> -	int p_inc_lo, p_inc_hi;
> -};
> -
> -#define PLLS_I8xx 0
> -#define PLLS_I9xx 1
> -#define PLLS_MAX 2
> -
> -static struct pll_min_max plls[PLLS_MAX] =3D {
> -	{ 108, 140, 18, 26,
> -	  6, 16, 3, 16,
> -	  4, 128, 0, 31,
> -	  930000, 1400000, 165000, 48000,
> -	  4, 2 },		/* I8xx */
> -
> -	{ 75, 120, 10, 20,
> -	  5, 9, 4, 7,
> -	  5, 80, 1, 8,
> -	  1400000, 2800000, 200000, 96000,
> -	  10, 5 }		/* I9xx */
> -};
> -
> -int intelfbhw_get_chipset(struct pci_dev *pdev, struct intelfb_info *din=
fo)
> -{
> -	u32 tmp;
> -	if (!pdev || !dinfo)
> -		return 1;
> -
> -	switch (pdev->device) {
> -	case PCI_DEVICE_ID_INTEL_830M:
> -		dinfo->name =3D "Intel(R) 830M";
> -		dinfo->chipset =3D INTEL_830M;
> -		dinfo->mobile =3D 1;
> -		dinfo->pll_index =3D PLLS_I8xx;
> -		return 0;
> -	case PCI_DEVICE_ID_INTEL_845G:
> -		dinfo->name =3D "Intel(R) 845G";
> -		dinfo->chipset =3D INTEL_845G;
> -		dinfo->mobile =3D 0;
> -		dinfo->pll_index =3D PLLS_I8xx;
> -		return 0;
> -	case PCI_DEVICE_ID_INTEL_854:
> -		dinfo->mobile =3D 1;
> -		dinfo->name =3D "Intel(R) 854";
> -		dinfo->chipset =3D INTEL_854;
> -		return 0;
> -	case PCI_DEVICE_ID_INTEL_85XGM:
> -		tmp =3D 0;
> -		dinfo->mobile =3D 1;
> -		dinfo->pll_index =3D PLLS_I8xx;
> -		pci_read_config_dword(pdev, INTEL_85X_CAPID, &tmp);
> -		switch ((tmp >> INTEL_85X_VARIANT_SHIFT) &
> -			INTEL_85X_VARIANT_MASK) {
> -		case INTEL_VAR_855GME:
> -			dinfo->name =3D "Intel(R) 855GME";
> -			dinfo->chipset =3D INTEL_855GME;
> -			return 0;
> -		case INTEL_VAR_855GM:
> -			dinfo->name =3D "Intel(R) 855GM";
> -			dinfo->chipset =3D INTEL_855GM;
> -			return 0;
> -		case INTEL_VAR_852GME:
> -			dinfo->name =3D "Intel(R) 852GME";
> -			dinfo->chipset =3D INTEL_852GME;
> -			return 0;
> -		case INTEL_VAR_852GM:
> -			dinfo->name =3D "Intel(R) 852GM";
> -			dinfo->chipset =3D INTEL_852GM;
> -			return 0;
> -		default:
> -			dinfo->name =3D "Intel(R) 852GM/855GM";
> -			dinfo->chipset =3D INTEL_85XGM;
> -			return 0;
> -		}
> -		break;
> -	case PCI_DEVICE_ID_INTEL_865G:
> -		dinfo->name =3D "Intel(R) 865G";
> -		dinfo->chipset =3D INTEL_865G;
> -		dinfo->mobile =3D 0;
> -		dinfo->pll_index =3D PLLS_I8xx;
> -		return 0;
> -	case PCI_DEVICE_ID_INTEL_915G:
> -		dinfo->name =3D "Intel(R) 915G";
> -		dinfo->chipset =3D INTEL_915G;
> -		dinfo->mobile =3D 0;
> -		dinfo->pll_index =3D PLLS_I9xx;
> -		return 0;
> -	case PCI_DEVICE_ID_INTEL_915GM:
> -		dinfo->name =3D "Intel(R) 915GM";
> -		dinfo->chipset =3D INTEL_915GM;
> -		dinfo->mobile =3D 1;
> -		dinfo->pll_index =3D PLLS_I9xx;
> -		return 0;
> -	case PCI_DEVICE_ID_INTEL_945G:
> -		dinfo->name =3D "Intel(R) 945G";
> -		dinfo->chipset =3D INTEL_945G;
> -		dinfo->mobile =3D 0;
> -		dinfo->pll_index =3D PLLS_I9xx;
> -		return 0;
> -	case PCI_DEVICE_ID_INTEL_945GM:
> -		dinfo->name =3D "Intel(R) 945GM";
> -		dinfo->chipset =3D INTEL_945GM;
> -		dinfo->mobile =3D 1;
> -		dinfo->pll_index =3D PLLS_I9xx;
> -		return 0;
> -	case PCI_DEVICE_ID_INTEL_945GME:
> -		dinfo->name =3D "Intel(R) 945GME";
> -		dinfo->chipset =3D INTEL_945GME;
> -		dinfo->mobile =3D 1;
> -		dinfo->pll_index =3D PLLS_I9xx;
> -		return 0;
> -	case PCI_DEVICE_ID_INTEL_965G:
> -		dinfo->name =3D "Intel(R) 965G";
> -		dinfo->chipset =3D INTEL_965G;
> -		dinfo->mobile =3D 0;
> -		dinfo->pll_index =3D PLLS_I9xx;
> -		return 0;
> -	case PCI_DEVICE_ID_INTEL_965GM:
> -		dinfo->name =3D "Intel(R) 965GM";
> -		dinfo->chipset =3D INTEL_965GM;
> -		dinfo->mobile =3D 1;
> -		dinfo->pll_index =3D PLLS_I9xx;
> -		return 0;
> -	default:
> -		return 1;
> -	}
> -}
> -
> -int intelfbhw_get_memory(struct pci_dev *pdev, int *aperture_size,
> -			 int *stolen_size)
> -{
> -	struct pci_dev *bridge_dev;
> -	u16 tmp;
> -	int stolen_overhead;
> -
> -	if (!pdev || !aperture_size || !stolen_size)
> -		return 1;
> -
> -	/* Find the bridge device.  It is always 0:0.0 */
> -	bridge_dev =3D pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus), 0,
> -						 PCI_DEVFN(0, 0));
> -	if (!bridge_dev) {
> -		ERR_MSG("cannot find bridge device\n");
> -		return 1;
> -	}
> -
> -	/* Get the fb aperture size and "stolen" memory amount. */
> -	tmp =3D 0;
> -	pci_read_config_word(bridge_dev, INTEL_GMCH_CTRL, &tmp);
> -	pci_dev_put(bridge_dev);
> -
> -	switch (pdev->device) {
> -	case PCI_DEVICE_ID_INTEL_915G:
> -	case PCI_DEVICE_ID_INTEL_915GM:
> -	case PCI_DEVICE_ID_INTEL_945G:
> -	case PCI_DEVICE_ID_INTEL_945GM:
> -	case PCI_DEVICE_ID_INTEL_945GME:
> -	case PCI_DEVICE_ID_INTEL_965G:
> -	case PCI_DEVICE_ID_INTEL_965GM:
> -		/*
> -		 * 915, 945 and 965 chipsets support 64MB, 128MB or 256MB
> -		 * aperture. Determine size from PCI resource length.
> -		 */
> -		*aperture_size =3D pci_resource_len(pdev, 2);
> -		break;
> -	default:
> -		if ((tmp & INTEL_GMCH_MEM_MASK) =3D=3D INTEL_GMCH_MEM_64M)
> -			*aperture_size =3D MB(64);
> -		else
> -			*aperture_size =3D MB(128);
> -		break;
> -	}
> -
> -	/* Stolen memory size is reduced by the GTT and the popup.
> -	   GTT is 1K per MB of aperture size, and popup is 4K. */
> -	stolen_overhead =3D (*aperture_size / MB(1)) + 4;
> -	switch(pdev->device) {
> -	case PCI_DEVICE_ID_INTEL_830M:
> -	case PCI_DEVICE_ID_INTEL_845G:
> -		switch (tmp & INTEL_830_GMCH_GMS_MASK) {
> -		case INTEL_830_GMCH_GMS_STOLEN_512:
> -			*stolen_size =3D KB(512) - KB(stolen_overhead);
> -			return 0;
> -		case INTEL_830_GMCH_GMS_STOLEN_1024:
> -			*stolen_size =3D MB(1) - KB(stolen_overhead);
> -			return 0;
> -		case INTEL_830_GMCH_GMS_STOLEN_8192:
> -			*stolen_size =3D MB(8) - KB(stolen_overhead);
> -			return 0;
> -		case INTEL_830_GMCH_GMS_LOCAL:
> -			ERR_MSG("only local memory found\n");
> -			return 1;
> -		case INTEL_830_GMCH_GMS_DISABLED:
> -			ERR_MSG("video memory is disabled\n");
> -			return 1;
> -		default:
> -			ERR_MSG("unexpected GMCH_GMS value: 0x%02x\n",
> -				tmp & INTEL_830_GMCH_GMS_MASK);
> -			return 1;
> -		}
> -		break;
> -	default:
> -		switch (tmp & INTEL_855_GMCH_GMS_MASK) {
> -		case INTEL_855_GMCH_GMS_STOLEN_1M:
> -			*stolen_size =3D MB(1) - KB(stolen_overhead);
> -			return 0;
> -		case INTEL_855_GMCH_GMS_STOLEN_4M:
> -			*stolen_size =3D MB(4) - KB(stolen_overhead);
> -			return 0;
> -		case INTEL_855_GMCH_GMS_STOLEN_8M:
> -			*stolen_size =3D MB(8) - KB(stolen_overhead);
> -			return 0;
> -		case INTEL_855_GMCH_GMS_STOLEN_16M:
> -			*stolen_size =3D MB(16) - KB(stolen_overhead);
> -			return 0;
> -		case INTEL_855_GMCH_GMS_STOLEN_32M:
> -			*stolen_size =3D MB(32) - KB(stolen_overhead);
> -			return 0;
> -		case INTEL_915G_GMCH_GMS_STOLEN_48M:
> -			*stolen_size =3D MB(48) - KB(stolen_overhead);
> -			return 0;
> -		case INTEL_915G_GMCH_GMS_STOLEN_64M:
> -			*stolen_size =3D MB(64) - KB(stolen_overhead);
> -			return 0;
> -		case INTEL_855_GMCH_GMS_DISABLED:
> -			ERR_MSG("video memory is disabled\n");
> -			return 0;
> -		default:
> -			ERR_MSG("unexpected GMCH_GMS value: 0x%02x\n",
> -				tmp & INTEL_855_GMCH_GMS_MASK);
> -			return 1;
> -		}
> -	}
> -}
> -
> -int intelfbhw_check_non_crt(struct intelfb_info *dinfo)
> -{
> -	int dvo =3D 0;
> -
> -	if (INREG(LVDS) & PORT_ENABLE)
> -		dvo |=3D LVDS_PORT;
> -	if (INREG(DVOA) & PORT_ENABLE)
> -		dvo |=3D DVOA_PORT;
> -	if (INREG(DVOB) & PORT_ENABLE)
> -		dvo |=3D DVOB_PORT;
> -	if (INREG(DVOC) & PORT_ENABLE)
> -		dvo |=3D DVOC_PORT;
> -
> -	return dvo;
> -}
> -
> -const char * intelfbhw_dvo_to_string(int dvo)
> -{
> -	if (dvo & DVOA_PORT)
> -		return "DVO port A";
> -	else if (dvo & DVOB_PORT)
> -		return "DVO port B";
> -	else if (dvo & DVOC_PORT)
> -		return "DVO port C";
> -	else if (dvo & LVDS_PORT)
> -		return "LVDS port";
> -	else
> -		return NULL;
> -}
> -
> -
> -int intelfbhw_validate_mode(struct intelfb_info *dinfo,
> -			    struct fb_var_screeninfo *var)
> -{
> -	int bytes_per_pixel;
> -	int tmp;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_validate_mode\n");
> -#endif
> -
> -	bytes_per_pixel =3D var->bits_per_pixel / 8;
> -	if (bytes_per_pixel =3D=3D 3)
> -		bytes_per_pixel =3D 4;
> -
> -	/* Check if enough video memory. */
> -	tmp =3D var->yres_virtual * var->xres_virtual * bytes_per_pixel;
> -	if (tmp > dinfo->fb.size) {
> -		WRN_MSG("Not enough video ram for mode "
> -			"(%d KByte vs %d KByte).\n",
> -			BtoKB(tmp), BtoKB(dinfo->fb.size));
> -		return 1;
> -	}
> -
> -	/* Check if x/y limits are OK. */
> -	if (var->xres - 1 > HACTIVE_MASK) {
> -		WRN_MSG("X resolution too large (%d vs %d).\n",
> -			var->xres, HACTIVE_MASK + 1);
> -		return 1;
> -	}
> -	if (var->yres - 1 > VACTIVE_MASK) {
> -		WRN_MSG("Y resolution too large (%d vs %d).\n",
> -			var->yres, VACTIVE_MASK + 1);
> -		return 1;
> -	}
> -	if (var->xres < 4) {
> -		WRN_MSG("X resolution too small (%d vs 4).\n", var->xres);
> -		return 1;
> -	}
> -	if (var->yres < 4) {
> -		WRN_MSG("Y resolution too small (%d vs 4).\n", var->yres);
> -		return 1;
> -	}
> -
> -	/* Check for doublescan modes. */
> -	if (var->vmode & FB_VMODE_DOUBLE) {
> -		WRN_MSG("Mode is double-scan.\n");
> -		return 1;
> -	}
> -
> -	if ((var->vmode & FB_VMODE_INTERLACED) && (var->yres & 1)) {
> -		WRN_MSG("Odd number of lines in interlaced mode\n");
> -		return 1;
> -	}
> -
> -	/* Check if clock is OK. */
> -	tmp =3D 1000000000 / var->pixclock;
> -	if (tmp < MIN_CLOCK) {
> -		WRN_MSG("Pixel clock is too low (%d MHz vs %d MHz).\n",
> -			(tmp + 500) / 1000, MIN_CLOCK / 1000);
> -		return 1;
> -	}
> -	if (tmp > MAX_CLOCK) {
> -		WRN_MSG("Pixel clock is too high (%d MHz vs %d MHz).\n",
> -			(tmp + 500) / 1000, MAX_CLOCK / 1000);
> -		return 1;
> -	}
> -
> -	return 0;
> -}
> -
> -int intelfbhw_pan_display(struct fb_var_screeninfo *var, struct fb_info =
*info)
> -{
> -	struct intelfb_info *dinfo =3D GET_DINFO(info);
> -	u32 offset, xoffset, yoffset;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_pan_display\n");
> -#endif
> -
> -	xoffset =3D ROUND_DOWN_TO(var->xoffset, 8);
> -	yoffset =3D var->yoffset;
> -
> -	if ((xoffset + info->var.xres > info->var.xres_virtual) ||
> -	    (yoffset + info->var.yres > info->var.yres_virtual))
> -		return -EINVAL;
> -
> -	offset =3D (yoffset * dinfo->pitch) +
> -		 (xoffset * info->var.bits_per_pixel) / 8;
> -
> -	offset +=3D dinfo->fb.offset << 12;
> -
> -	dinfo->vsync.pan_offset =3D offset;
> -	if ((var->activate & FB_ACTIVATE_VBL) &&
> -	    !intelfbhw_enable_irq(dinfo))
> -		dinfo->vsync.pan_display =3D 1;
> -	else {
> -		dinfo->vsync.pan_display =3D 0;
> -		OUTREG(DSPABASE, offset);
> -	}
> -
> -	return 0;
> -}
> -
> -/* Blank the screen. */
> -void intelfbhw_do_blank(int blank, struct fb_info *info)
> -{
> -	struct intelfb_info *dinfo =3D GET_DINFO(info);
> -	u32 tmp;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_do_blank: blank is %d\n", blank);
> -#endif
> -
> -	/* Turn plane A on or off */
> -	tmp =3D INREG(DSPACNTR);
> -	if (blank)
> -		tmp &=3D ~DISPPLANE_PLANE_ENABLE;
> -	else
> -		tmp |=3D DISPPLANE_PLANE_ENABLE;
> -	OUTREG(DSPACNTR, tmp);
> -	/* Flush */
> -	tmp =3D INREG(DSPABASE);
> -	OUTREG(DSPABASE, tmp);
> -
> -	/* Turn off/on the HW cursor */
> -#if VERBOSE > 0
> -	DBG_MSG("cursor_on is %d\n", dinfo->cursor_on);
> -#endif
> -	if (dinfo->cursor_on) {
> -		if (blank)
> -			intelfbhw_cursor_hide(dinfo);
> -		else
> -			intelfbhw_cursor_show(dinfo);
> -		dinfo->cursor_on =3D 1;
> -	}
> -	dinfo->cursor_blanked =3D blank;
> -
> -	/* Set DPMS level */
> -	tmp =3D INREG(ADPA) & ~ADPA_DPMS_CONTROL_MASK;
> -	switch (blank) {
> -	case FB_BLANK_UNBLANK:
> -	case FB_BLANK_NORMAL:
> -		tmp |=3D ADPA_DPMS_D0;
> -		break;
> -	case FB_BLANK_VSYNC_SUSPEND:
> -		tmp |=3D ADPA_DPMS_D1;
> -		break;
> -	case FB_BLANK_HSYNC_SUSPEND:
> -		tmp |=3D ADPA_DPMS_D2;
> -		break;
> -	case FB_BLANK_POWERDOWN:
> -		tmp |=3D ADPA_DPMS_D3;
> -		break;
> -	}
> -	OUTREG(ADPA, tmp);
> -
> -	return;
> -}
> -
> -
> -/* Check which pipe is connected to an active display plane. */
> -int intelfbhw_active_pipe(const struct intelfb_hwstate *hw)
> -{
> -	int pipe =3D -1;
> -
> -	/* keep old default behaviour - prefer PIPE_A */
> -	if (hw->disp_b_ctrl & DISPPLANE_PLANE_ENABLE) {
> -		pipe =3D (hw->disp_b_ctrl >> DISPPLANE_SEL_PIPE_SHIFT);
> -		pipe &=3D PIPE_MASK;
> -		if (unlikely(pipe =3D=3D PIPE_A))
> -			return PIPE_A;
> -	}
> -	if (hw->disp_a_ctrl & DISPPLANE_PLANE_ENABLE) {
> -		pipe =3D (hw->disp_a_ctrl >> DISPPLANE_SEL_PIPE_SHIFT);
> -		pipe &=3D PIPE_MASK;
> -		if (likely(pipe =3D=3D PIPE_A))
> -			return PIPE_A;
> -	}
> -	/* Impossible that no pipe is selected - return PIPE_A */
> -	WARN_ON(pipe =3D=3D -1);
> -	if (unlikely(pipe =3D=3D -1))
> -		pipe =3D PIPE_A;
> -
> -	return pipe;
> -}
> -
> -void intelfbhw_setcolreg(struct intelfb_info *dinfo, unsigned regno,
> -			 unsigned red, unsigned green, unsigned blue,
> -			 unsigned transp)
> -{
> -	u32 palette_reg =3D (dinfo->pipe =3D=3D PIPE_A) ?
> -			  PALETTE_A : PALETTE_B;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_setcolreg: %d: (%d, %d, %d)\n",
> -		regno, red, green, blue);
> -#endif
> -
> -	OUTREG(palette_reg + (regno << 2),
> -	       (red << PALETTE_8_RED_SHIFT) |
> -	       (green << PALETTE_8_GREEN_SHIFT) |
> -	       (blue << PALETTE_8_BLUE_SHIFT));
> -}
> -
> -
> -int intelfbhw_read_hw_state(struct intelfb_info *dinfo,
> -			    struct intelfb_hwstate *hw, int flag)
> -{
> -	int i;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_read_hw_state\n");
> -#endif
> -
> -	if (!hw || !dinfo)
> -		return -1;
> -
> -	/* Read in as much of the HW state as possible. */
> -	hw->vga0_divisor =3D INREG(VGA0_DIVISOR);
> -	hw->vga1_divisor =3D INREG(VGA1_DIVISOR);
> -	hw->vga_pd =3D INREG(VGAPD);
> -	hw->dpll_a =3D INREG(DPLL_A);
> -	hw->dpll_b =3D INREG(DPLL_B);
> -	hw->fpa0 =3D INREG(FPA0);
> -	hw->fpa1 =3D INREG(FPA1);
> -	hw->fpb0 =3D INREG(FPB0);
> -	hw->fpb1 =3D INREG(FPB1);
> -
> -	if (flag =3D=3D 1)
> -		return flag;
> -
> -#if 0
> -	/* This seems to be a problem with the 852GM/855GM */
> -	for (i =3D 0; i < PALETTE_8_ENTRIES; i++) {
> -		hw->palette_a[i] =3D INREG(PALETTE_A + (i << 2));
> -		hw->palette_b[i] =3D INREG(PALETTE_B + (i << 2));
> -	}
> -#endif
> -
> -	if (flag =3D=3D 2)
> -		return flag;
> -
> -	hw->htotal_a =3D INREG(HTOTAL_A);
> -	hw->hblank_a =3D INREG(HBLANK_A);
> -	hw->hsync_a =3D INREG(HSYNC_A);
> -	hw->vtotal_a =3D INREG(VTOTAL_A);
> -	hw->vblank_a =3D INREG(VBLANK_A);
> -	hw->vsync_a =3D INREG(VSYNC_A);
> -	hw->src_size_a =3D INREG(SRC_SIZE_A);
> -	hw->bclrpat_a =3D INREG(BCLRPAT_A);
> -	hw->htotal_b =3D INREG(HTOTAL_B);
> -	hw->hblank_b =3D INREG(HBLANK_B);
> -	hw->hsync_b =3D INREG(HSYNC_B);
> -	hw->vtotal_b =3D INREG(VTOTAL_B);
> -	hw->vblank_b =3D INREG(VBLANK_B);
> -	hw->vsync_b =3D INREG(VSYNC_B);
> -	hw->src_size_b =3D INREG(SRC_SIZE_B);
> -	hw->bclrpat_b =3D INREG(BCLRPAT_B);
> -
> -	if (flag =3D=3D 3)
> -		return flag;
> -
> -	hw->adpa =3D INREG(ADPA);
> -	hw->dvoa =3D INREG(DVOA);
> -	hw->dvob =3D INREG(DVOB);
> -	hw->dvoc =3D INREG(DVOC);
> -	hw->dvoa_srcdim =3D INREG(DVOA_SRCDIM);
> -	hw->dvob_srcdim =3D INREG(DVOB_SRCDIM);
> -	hw->dvoc_srcdim =3D INREG(DVOC_SRCDIM);
> -	hw->lvds =3D INREG(LVDS);
> -
> -	if (flag =3D=3D 4)
> -		return flag;
> -
> -	hw->pipe_a_conf =3D INREG(PIPEACONF);
> -	hw->pipe_b_conf =3D INREG(PIPEBCONF);
> -	hw->disp_arb =3D INREG(DISPARB);
> -
> -	if (flag =3D=3D 5)
> -		return flag;
> -
> -	hw->cursor_a_control =3D INREG(CURSOR_A_CONTROL);
> -	hw->cursor_b_control =3D INREG(CURSOR_B_CONTROL);
> -	hw->cursor_a_base =3D INREG(CURSOR_A_BASEADDR);
> -	hw->cursor_b_base =3D INREG(CURSOR_B_BASEADDR);
> -
> -	if (flag =3D=3D 6)
> -		return flag;
> -
> -	for (i =3D 0; i < 4; i++) {
> -		hw->cursor_a_palette[i] =3D INREG(CURSOR_A_PALETTE0 + (i << 2));
> -		hw->cursor_b_palette[i] =3D INREG(CURSOR_B_PALETTE0 + (i << 2));
> -	}
> -
> -	if (flag =3D=3D 7)
> -		return flag;
> -
> -	hw->cursor_size =3D INREG(CURSOR_SIZE);
> -
> -	if (flag =3D=3D 8)
> -		return flag;
> -
> -	hw->disp_a_ctrl =3D INREG(DSPACNTR);
> -	hw->disp_b_ctrl =3D INREG(DSPBCNTR);
> -	hw->disp_a_base =3D INREG(DSPABASE);
> -	hw->disp_b_base =3D INREG(DSPBBASE);
> -	hw->disp_a_stride =3D INREG(DSPASTRIDE);
> -	hw->disp_b_stride =3D INREG(DSPBSTRIDE);
> -
> -	if (flag =3D=3D 9)
> -		return flag;
> -
> -	hw->vgacntrl =3D INREG(VGACNTRL);
> -
> -	if (flag =3D=3D 10)
> -		return flag;
> -
> -	hw->add_id =3D INREG(ADD_ID);
> -
> -	if (flag =3D=3D 11)
> -		return flag;
> -
> -	for (i =3D 0; i < 7; i++) {
> -		hw->swf0x[i] =3D INREG(SWF00 + (i << 2));
> -		hw->swf1x[i] =3D INREG(SWF10 + (i << 2));
> -		if (i < 3)
> -			hw->swf3x[i] =3D INREG(SWF30 + (i << 2));
> -	}
> -
> -	for (i =3D 0; i < 8; i++)
> -		hw->fence[i] =3D INREG(FENCE + (i << 2));
> -
> -	hw->instpm =3D INREG(INSTPM);
> -	hw->mem_mode =3D INREG(MEM_MODE);
> -	hw->fw_blc_0 =3D INREG(FW_BLC_0);
> -	hw->fw_blc_1 =3D INREG(FW_BLC_1);
> -
> -	hw->hwstam =3D INREG16(HWSTAM);
> -	hw->ier =3D INREG16(IER);
> -	hw->iir =3D INREG16(IIR);
> -	hw->imr =3D INREG16(IMR);
> -
> -	return 0;
> -}
> -
> -
> -static int calc_vclock3(int index, int m, int n, int p)
> -{
> -	if (p =3D=3D 0 || n =3D=3D 0)
> -		return 0;
> -	return plls[index].ref_clk * m / n / p;
> -}
> -
> -static int calc_vclock(int index, int m1, int m2, int n, int p1, int p2,
> -		       int lvds)
> -{
> -	struct pll_min_max *pll =3D &plls[index];
> -	u32 m, vco, p;
> -
> -	m =3D (5 * (m1 + 2)) + (m2 + 2);
> -	n +=3D 2;
> -	vco =3D pll->ref_clk * m / n;
> -
> -	if (index =3D=3D PLLS_I8xx)
> -		p =3D ((p1 + 2) * (1 << (p2 + 1)));
> -	else
> -		p =3D ((p1) * (p2 ? 5 : 10));
> -	return vco / p;
> -}
> -
> -#if REGDUMP
> -static void intelfbhw_get_p1p2(struct intelfb_info *dinfo, int dpll,
> -			       int *o_p1, int *o_p2)
> -{
> -	int p1, p2;
> -
> -	if (IS_I9XX(dinfo)) {
> -		if (dpll & DPLL_P1_FORCE_DIV2)
> -			p1 =3D 1;
> -		else
> -			p1 =3D (dpll >> DPLL_P1_SHIFT) & 0xff;
> -
> -		p1 =3D ffs(p1);
> -
> -		p2 =3D (dpll >> DPLL_I9XX_P2_SHIFT) & DPLL_P2_MASK;
> -	} else {
> -		if (dpll & DPLL_P1_FORCE_DIV2)
> -			p1 =3D 0;
> -		else
> -			p1 =3D (dpll >> DPLL_P1_SHIFT) & DPLL_P1_MASK;
> -		p2 =3D (dpll >> DPLL_P2_SHIFT) & DPLL_P2_MASK;
> -	}
> -
> -	*o_p1 =3D p1;
> -	*o_p2 =3D p2;
> -}
> -#endif
> -
> -
> -void intelfbhw_print_hw_state(struct intelfb_info *dinfo,
> -			      struct intelfb_hwstate *hw)
> -{
> -#if REGDUMP
> -	int i, m1, m2, n, p1, p2;
> -	int index =3D dinfo->pll_index;
> -	DBG_MSG("intelfbhw_print_hw_state\n");
> -
> -	if (!hw)
> -		return;
> -	/* Read in as much of the HW state as possible. */
> -	printk("hw state dump start\n");
> -	printk("	VGA0_DIVISOR:		0x%08x\n", hw->vga0_divisor);
> -	printk("	VGA1_DIVISOR:		0x%08x\n", hw->vga1_divisor);
> -	printk("	VGAPD:			0x%08x\n", hw->vga_pd);
> -	n =3D (hw->vga0_divisor >> FP_N_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -	m1 =3D (hw->vga0_divisor >> FP_M1_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -	m2 =3D (hw->vga0_divisor >> FP_M2_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -
> -	intelfbhw_get_p1p2(dinfo, hw->vga_pd, &p1, &p2);
> -
> -	printk("	VGA0: (m1, m2, n, p1, p2) =3D (%d, %d, %d, %d, %d)\n",
> -	       m1, m2, n, p1, p2);
> -	printk("	VGA0: clock is %d\n",
> -	       calc_vclock(index, m1, m2, n, p1, p2, 0));
> -
> -	n =3D (hw->vga1_divisor >> FP_N_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -	m1 =3D (hw->vga1_divisor >> FP_M1_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -	m2 =3D (hw->vga1_divisor >> FP_M2_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -
> -	intelfbhw_get_p1p2(dinfo, hw->vga_pd, &p1, &p2);
> -	printk("	VGA1: (m1, m2, n, p1, p2) =3D (%d, %d, %d, %d, %d)\n",
> -	       m1, m2, n, p1, p2);
> -	printk("	VGA1: clock is %d\n",
> -	       calc_vclock(index, m1, m2, n, p1, p2, 0));
> -
> -	printk("	DPLL_A:			0x%08x\n", hw->dpll_a);
> -	printk("	DPLL_B:			0x%08x\n", hw->dpll_b);
> -	printk("	FPA0:			0x%08x\n", hw->fpa0);
> -	printk("	FPA1:			0x%08x\n", hw->fpa1);
> -	printk("	FPB0:			0x%08x\n", hw->fpb0);
> -	printk("	FPB1:			0x%08x\n", hw->fpb1);
> -
> -	n =3D (hw->fpa0 >> FP_N_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -	m1 =3D (hw->fpa0 >> FP_M1_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -	m2 =3D (hw->fpa0 >> FP_M2_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -
> -	intelfbhw_get_p1p2(dinfo, hw->dpll_a, &p1, &p2);
> -
> -	printk("	PLLA0: (m1, m2, n, p1, p2) =3D (%d, %d, %d, %d, %d)\n",
> -	       m1, m2, n, p1, p2);
> -	printk("	PLLA0: clock is %d\n",
> -	       calc_vclock(index, m1, m2, n, p1, p2, 0));
> -
> -	n =3D (hw->fpa1 >> FP_N_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -	m1 =3D (hw->fpa1 >> FP_M1_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -	m2 =3D (hw->fpa1 >> FP_M2_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
> -
> -	intelfbhw_get_p1p2(dinfo, hw->dpll_a, &p1, &p2);
> -
> -	printk("	PLLA1: (m1, m2, n, p1, p2) =3D (%d, %d, %d, %d, %d)\n",
> -	       m1, m2, n, p1, p2);
> -	printk("	PLLA1: clock is %d\n",
> -	       calc_vclock(index, m1, m2, n, p1, p2, 0));
> -
> -#if 0
> -	printk("	PALETTE_A:\n");
> -	for (i =3D 0; i < PALETTE_8_ENTRIES)
> -		printk("	%3d:	0x%08x\n", i, hw->palette_a[i]);
> -	printk("	PALETTE_B:\n");
> -	for (i =3D 0; i < PALETTE_8_ENTRIES)
> -		printk("	%3d:	0x%08x\n", i, hw->palette_b[i]);
> -#endif
> -
> -	printk("	HTOTAL_A:		0x%08x\n", hw->htotal_a);
> -	printk("	HBLANK_A:		0x%08x\n", hw->hblank_a);
> -	printk("	HSYNC_A:		0x%08x\n", hw->hsync_a);
> -	printk("	VTOTAL_A:		0x%08x\n", hw->vtotal_a);
> -	printk("	VBLANK_A:		0x%08x\n", hw->vblank_a);
> -	printk("	VSYNC_A:		0x%08x\n", hw->vsync_a);
> -	printk("	SRC_SIZE_A:		0x%08x\n", hw->src_size_a);
> -	printk("	BCLRPAT_A:		0x%08x\n", hw->bclrpat_a);
> -	printk("	HTOTAL_B:		0x%08x\n", hw->htotal_b);
> -	printk("	HBLANK_B:		0x%08x\n", hw->hblank_b);
> -	printk("	HSYNC_B:		0x%08x\n", hw->hsync_b);
> -	printk("	VTOTAL_B:		0x%08x\n", hw->vtotal_b);
> -	printk("	VBLANK_B:		0x%08x\n", hw->vblank_b);
> -	printk("	VSYNC_B:		0x%08x\n", hw->vsync_b);
> -	printk("	SRC_SIZE_B:		0x%08x\n", hw->src_size_b);
> -	printk("	BCLRPAT_B:		0x%08x\n", hw->bclrpat_b);
> -
> -	printk("	ADPA:			0x%08x\n", hw->adpa);
> -	printk("	DVOA:			0x%08x\n", hw->dvoa);
> -	printk("	DVOB:			0x%08x\n", hw->dvob);
> -	printk("	DVOC:			0x%08x\n", hw->dvoc);
> -	printk("	DVOA_SRCDIM:		0x%08x\n", hw->dvoa_srcdim);
> -	printk("	DVOB_SRCDIM:		0x%08x\n", hw->dvob_srcdim);
> -	printk("	DVOC_SRCDIM:		0x%08x\n", hw->dvoc_srcdim);
> -	printk("	LVDS:			0x%08x\n", hw->lvds);
> -
> -	printk("	PIPEACONF:		0x%08x\n", hw->pipe_a_conf);
> -	printk("	PIPEBCONF:		0x%08x\n", hw->pipe_b_conf);
> -	printk("	DISPARB:		0x%08x\n", hw->disp_arb);
> -
> -	printk("	CURSOR_A_CONTROL:	0x%08x\n", hw->cursor_a_control);
> -	printk("	CURSOR_B_CONTROL:	0x%08x\n", hw->cursor_b_control);
> -	printk("	CURSOR_A_BASEADDR:	0x%08x\n", hw->cursor_a_base);
> -	printk("	CURSOR_B_BASEADDR:	0x%08x\n", hw->cursor_b_base);
> -
> -	printk("	CURSOR_A_PALETTE:	");
> -	for (i =3D 0; i < 4; i++) {
> -		printk("0x%08x", hw->cursor_a_palette[i]);
> -		if (i < 3)
> -			printk(", ");
> -	}
> -	printk("\n");
> -	printk("	CURSOR_B_PALETTE:	");
> -	for (i =3D 0; i < 4; i++) {
> -		printk("0x%08x", hw->cursor_b_palette[i]);
> -		if (i < 3)
> -			printk(", ");
> -	}
> -	printk("\n");
> -
> -	printk("	CURSOR_SIZE:		0x%08x\n", hw->cursor_size);
> -
> -	printk("	DSPACNTR:		0x%08x\n", hw->disp_a_ctrl);
> -	printk("	DSPBCNTR:		0x%08x\n", hw->disp_b_ctrl);
> -	printk("	DSPABASE:		0x%08x\n", hw->disp_a_base);
> -	printk("	DSPBBASE:		0x%08x\n", hw->disp_b_base);
> -	printk("	DSPASTRIDE:		0x%08x\n", hw->disp_a_stride);
> -	printk("	DSPBSTRIDE:		0x%08x\n", hw->disp_b_stride);
> -
> -	printk("	VGACNTRL:		0x%08x\n", hw->vgacntrl);
> -	printk("	ADD_ID:			0x%08x\n", hw->add_id);
> -
> -	for (i =3D 0; i < 7; i++) {
> -		printk("	SWF0%d			0x%08x\n", i,
> -			hw->swf0x[i]);
> -	}
> -	for (i =3D 0; i < 7; i++) {
> -		printk("	SWF1%d			0x%08x\n", i,
> -			hw->swf1x[i]);
> -	}
> -	for (i =3D 0; i < 3; i++) {
> -		printk("	SWF3%d			0x%08x\n", i,
> -		       hw->swf3x[i]);
> -	}
> -	for (i =3D 0; i < 8; i++)
> -		printk("	FENCE%d			0x%08x\n", i,
> -		       hw->fence[i]);
> -
> -	printk("	INSTPM			0x%08x\n", hw->instpm);
> -	printk("	MEM_MODE		0x%08x\n", hw->mem_mode);
> -	printk("	FW_BLC_0		0x%08x\n", hw->fw_blc_0);
> -	printk("	FW_BLC_1		0x%08x\n", hw->fw_blc_1);
> -
> -	printk("	HWSTAM			0x%04x\n", hw->hwstam);
> -	printk("	IER			0x%04x\n", hw->ier);
> -	printk("	IIR			0x%04x\n", hw->iir);
> -	printk("	IMR			0x%04x\n", hw->imr);
> -	printk("hw state dump end\n");
> -#endif
> -}
> -
> -
> -
> -/* Split the M parameter into M1 and M2. */
> -static int splitm(int index, unsigned int m, unsigned int *retm1,
> -		  unsigned int *retm2)
> -{
> -	int m1, m2;
> -	int testm;
> -	struct pll_min_max *pll =3D &plls[index];
> -
> -	/* no point optimising too much - brute force m */
> -	for (m1 =3D pll->min_m1; m1 < pll->max_m1 + 1; m1++) {
> -		for (m2 =3D pll->min_m2; m2 < pll->max_m2 + 1; m2++) {
> -			testm =3D (5 * (m1 + 2)) + (m2 + 2);
> -			if (testm =3D=3D m) {
> -				*retm1 =3D (unsigned int)m1;
> -				*retm2 =3D (unsigned int)m2;
> -				return 0;
> -			}
> -		}
> -	}
> -	return 1;
> -}
> -
> -/* Split the P parameter into P1 and P2. */
> -static int splitp(int index, unsigned int p, unsigned int *retp1,
> -		  unsigned int *retp2)
> -{
> -	int p1, p2;
> -	struct pll_min_max *pll =3D &plls[index];
> -
> -	if (index =3D=3D PLLS_I9xx) {
> -		p2 =3D (p % 10) ? 1 : 0;
> -
> -		p1 =3D p / (p2 ? 5 : 10);
> -
> -		*retp1 =3D (unsigned int)p1;
> -		*retp2 =3D (unsigned int)p2;
> -		return 0;
> -	}
> -
> -	if (p % 4 =3D=3D 0)
> -		p2 =3D 1;
> -	else
> -		p2 =3D 0;
> -	p1 =3D (p / (1 << (p2 + 1))) - 2;
> -	if (p % 4 =3D=3D 0 && p1 < pll->min_p1) {
> -		p2 =3D 0;
> -		p1 =3D (p / (1 << (p2 + 1))) - 2;
> -	}
> -	if (p1 < pll->min_p1 || p1 > pll->max_p1 ||
> -	    (p1 + 2) * (1 << (p2 + 1)) !=3D p) {
> -		return 1;
> -	} else {
> -		*retp1 =3D (unsigned int)p1;
> -		*retp2 =3D (unsigned int)p2;
> -		return 0;
> -	}
> -}
> -
> -static int calc_pll_params(int index, int clock, u32 *retm1, u32 *retm2,
> -			   u32 *retn, u32 *retp1, u32 *retp2, u32 *retclock)
> -{
> -	u32 m1, m2, n, p1, p2, n1, testm;
> -	u32 f_vco, p, p_best =3D 0, m, f_out =3D 0;
> -	u32 err_best =3D 10000000;
> -	u32 n_best =3D 0, m_best =3D 0, f_err;
> -	u32 p_min, p_max, p_inc, div_max;
> -	struct pll_min_max *pll =3D &plls[index];
> -
> -	DBG_MSG("Clock is %d\n", clock);
> -
> -	div_max =3D pll->max_vco / clock;
> -
> -	p_inc =3D (clock <=3D pll->p_transition_clk) ? pll->p_inc_lo : pll->p_i=
nc_hi;
> -	p_min =3D p_inc;
> -	p_max =3D ROUND_DOWN_TO(div_max, p_inc);
> -	if (p_min < pll->min_p)
> -		p_min =3D pll->min_p;
> -	if (p_max > pll->max_p)
> -		p_max =3D pll->max_p;
> -
> -	DBG_MSG("p range is %d-%d (%d)\n", p_min, p_max, p_inc);
> -
> -	p =3D p_min;
> -	do {
> -		if (splitp(index, p, &p1, &p2)) {
> -			WRN_MSG("cannot split p =3D %d\n", p);
> -			p +=3D p_inc;
> -			continue;
> -		}
> -		n =3D pll->min_n;
> -		f_vco =3D clock * p;
> -
> -		do {
> -			m =3D ROUND_UP_TO(f_vco * n, pll->ref_clk) / pll->ref_clk;
> -			if (m < pll->min_m)
> -				m =3D pll->min_m + 1;
> -			if (m > pll->max_m)
> -				m =3D pll->max_m - 1;
> -			for (testm =3D m - 1; testm <=3D m; testm++) {
> -				f_out =3D calc_vclock3(index, testm, n, p);
> -				if (splitm(index, testm, &m1, &m2)) {
> -					WRN_MSG("cannot split m =3D %d\n",
> -						testm);
> -					continue;
> -				}
> -				if (clock > f_out)
> -					f_err =3D clock - f_out;
> -				else/* slightly bias the error for bigger clocks */
> -					f_err =3D f_out - clock + 1;
> -
> -				if (f_err < err_best) {
> -					m_best =3D testm;
> -					n_best =3D n;
> -					p_best =3D p;
> -					err_best =3D f_err;
> -				}
> -			}
> -			n++;
> -		} while ((n <=3D pll->max_n) && (f_out >=3D clock));
> -		p +=3D p_inc;
> -	} while ((p <=3D p_max));
> -
> -	if (!m_best) {
> -		WRN_MSG("cannot find parameters for clock %d\n", clock);
> -		return 1;
> -	}
> -	m =3D m_best;
> -	n =3D n_best;
> -	p =3D p_best;
> -	splitm(index, m, &m1, &m2);
> -	splitp(index, p, &p1, &p2);
> -	n1 =3D n - 2;
> -
> -	DBG_MSG("m, n, p: %d (%d,%d), %d (%d), %d (%d,%d), "
> -		"f: %d (%d), VCO: %d\n",
> -		m, m1, m2, n, n1, p, p1, p2,
> -		calc_vclock3(index, m, n, p),
> -		calc_vclock(index, m1, m2, n1, p1, p2, 0),
> -		calc_vclock3(index, m, n, p) * p);
> -	*retm1 =3D m1;
> -	*retm2 =3D m2;
> -	*retn =3D n1;
> -	*retp1 =3D p1;
> -	*retp2 =3D p2;
> -	*retclock =3D calc_vclock(index, m1, m2, n1, p1, p2, 0);
> -
> -	return 0;
> -}
> -
> -static __inline__ int check_overflow(u32 value, u32 limit,
> -				     const char *description)
> -{
> -	if (value > limit) {
> -		WRN_MSG("%s value %d exceeds limit %d\n",
> -			description, value, limit);
> -		return 1;
> -	}
> -	return 0;
> -}
> -
> -/* It is assumed that hw is filled in with the initial state information=
=2E */
> -int intelfbhw_mode_to_hw(struct intelfb_info *dinfo,
> -			 struct intelfb_hwstate *hw,
> -			 struct fb_var_screeninfo *var)
> -{
> -	int pipe =3D intelfbhw_active_pipe(hw);
> -	u32 *dpll, *fp0, *fp1;
> -	u32 m1, m2, n, p1, p2, clock_target, clock;
> -	u32 hsync_start, hsync_end, hblank_start, hblank_end, htotal, hactive;
> -	u32 vsync_start, vsync_end, vblank_start, vblank_end, vtotal, vactive;
> -	u32 vsync_pol, hsync_pol;
> -	u32 *vs, *vb, *vt, *hs, *hb, *ht, *ss, *pipe_conf;
> -	u32 stride_alignment;
> -
> -	DBG_MSG("intelfbhw_mode_to_hw\n");
> -
> -	/* Disable VGA */
> -	hw->vgacntrl |=3D VGA_DISABLE;
> -
> -	/* Set which pipe's registers will be set. */
> -	if (pipe =3D=3D PIPE_B) {
> -		dpll =3D &hw->dpll_b;
> -		fp0 =3D &hw->fpb0;
> -		fp1 =3D &hw->fpb1;
> -		hs =3D &hw->hsync_b;
> -		hb =3D &hw->hblank_b;
> -		ht =3D &hw->htotal_b;
> -		vs =3D &hw->vsync_b;
> -		vb =3D &hw->vblank_b;
> -		vt =3D &hw->vtotal_b;
> -		ss =3D &hw->src_size_b;
> -		pipe_conf =3D &hw->pipe_b_conf;
> -	} else {
> -		dpll =3D &hw->dpll_a;
> -		fp0 =3D &hw->fpa0;
> -		fp1 =3D &hw->fpa1;
> -		hs =3D &hw->hsync_a;
> -		hb =3D &hw->hblank_a;
> -		ht =3D &hw->htotal_a;
> -		vs =3D &hw->vsync_a;
> -		vb =3D &hw->vblank_a;
> -		vt =3D &hw->vtotal_a;
> -		ss =3D &hw->src_size_a;
> -		pipe_conf =3D &hw->pipe_a_conf;
> -	}
> -
> -	/* Use ADPA register for sync control. */
> -	hw->adpa &=3D ~ADPA_USE_VGA_HVPOLARITY;
> -
> -	/* sync polarity */
> -	hsync_pol =3D (var->sync & FB_SYNC_HOR_HIGH_ACT) ?
> -			ADPA_SYNC_ACTIVE_HIGH : ADPA_SYNC_ACTIVE_LOW;
> -	vsync_pol =3D (var->sync & FB_SYNC_VERT_HIGH_ACT) ?
> -			ADPA_SYNC_ACTIVE_HIGH : ADPA_SYNC_ACTIVE_LOW;
> -	hw->adpa &=3D ~((ADPA_SYNC_ACTIVE_MASK << ADPA_VSYNC_ACTIVE_SHIFT) |
> -		      (ADPA_SYNC_ACTIVE_MASK << ADPA_HSYNC_ACTIVE_SHIFT));
> -	hw->adpa |=3D (hsync_pol << ADPA_HSYNC_ACTIVE_SHIFT) |
> -		    (vsync_pol << ADPA_VSYNC_ACTIVE_SHIFT);
> -
> -	/* Connect correct pipe to the analog port DAC */
> -	hw->adpa &=3D ~(PIPE_MASK << ADPA_PIPE_SELECT_SHIFT);
> -	hw->adpa |=3D (pipe << ADPA_PIPE_SELECT_SHIFT);
> -
> -	/* Set DPMS state to D0 (on) */
> -	hw->adpa &=3D ~ADPA_DPMS_CONTROL_MASK;
> -	hw->adpa |=3D ADPA_DPMS_D0;
> -
> -	hw->adpa |=3D ADPA_DAC_ENABLE;
> -
> -	*dpll |=3D (DPLL_VCO_ENABLE | DPLL_VGA_MODE_DISABLE);
> -	*dpll &=3D ~(DPLL_RATE_SELECT_MASK | DPLL_REFERENCE_SELECT_MASK);
> -	*dpll |=3D (DPLL_REFERENCE_DEFAULT | DPLL_RATE_SELECT_FP0);
> -
> -	/* Desired clock in kHz */
> -	clock_target =3D 1000000000 / var->pixclock;
> -
> -	if (calc_pll_params(dinfo->pll_index, clock_target, &m1, &m2,
> -			    &n, &p1, &p2, &clock)) {
> -		WRN_MSG("calc_pll_params failed\n");
> -		return 1;
> -	}
> -
> -	/* Check for overflow. */
> -	if (check_overflow(p1, DPLL_P1_MASK, "PLL P1 parameter"))
> -		return 1;
> -	if (check_overflow(p2, DPLL_P2_MASK, "PLL P2 parameter"))
> -		return 1;
> -	if (check_overflow(m1, FP_DIVISOR_MASK, "PLL M1 parameter"))
> -		return 1;
> -	if (check_overflow(m2, FP_DIVISOR_MASK, "PLL M2 parameter"))
> -		return 1;
> -	if (check_overflow(n, FP_DIVISOR_MASK, "PLL N parameter"))
> -		return 1;
> -
> -	*dpll &=3D ~DPLL_P1_FORCE_DIV2;
> -	*dpll &=3D ~((DPLL_P2_MASK << DPLL_P2_SHIFT) |
> -		   (DPLL_P1_MASK << DPLL_P1_SHIFT));
> -
> -	if (IS_I9XX(dinfo)) {
> -		*dpll |=3D (p2 << DPLL_I9XX_P2_SHIFT);
> -		*dpll |=3D (1 << (p1 - 1)) << DPLL_P1_SHIFT;
> -	} else
> -		*dpll |=3D (p2 << DPLL_P2_SHIFT) | (p1 << DPLL_P1_SHIFT);
> -
> -	*fp0 =3D (n << FP_N_DIVISOR_SHIFT) |
> -	       (m1 << FP_M1_DIVISOR_SHIFT) |
> -	       (m2 << FP_M2_DIVISOR_SHIFT);
> -	*fp1 =3D *fp0;
> -
> -	hw->dvob &=3D ~PORT_ENABLE;
> -	hw->dvoc &=3D ~PORT_ENABLE;
> -
> -	/* Use display plane A. */
> -	hw->disp_a_ctrl |=3D DISPPLANE_PLANE_ENABLE;
> -	hw->disp_a_ctrl &=3D ~DISPPLANE_GAMMA_ENABLE;
> -	hw->disp_a_ctrl &=3D ~DISPPLANE_PIXFORMAT_MASK;
> -	switch (intelfb_var_to_depth(var)) {
> -	case 8:
> -		hw->disp_a_ctrl |=3D DISPPLANE_8BPP | DISPPLANE_GAMMA_ENABLE;
> -		break;
> -	case 15:
> -		hw->disp_a_ctrl |=3D DISPPLANE_15_16BPP;
> -		break;
> -	case 16:
> -		hw->disp_a_ctrl |=3D DISPPLANE_16BPP;
> -		break;
> -	case 24:
> -		hw->disp_a_ctrl |=3D DISPPLANE_32BPP_NO_ALPHA;
> -		break;
> -	}
> -	hw->disp_a_ctrl &=3D ~(PIPE_MASK << DISPPLANE_SEL_PIPE_SHIFT);
> -	hw->disp_a_ctrl |=3D (pipe << DISPPLANE_SEL_PIPE_SHIFT);
> -
> -	/* Set CRTC registers. */
> -	hactive =3D var->xres;
> -	hsync_start =3D hactive + var->right_margin;
> -	hsync_end =3D hsync_start + var->hsync_len;
> -	htotal =3D hsync_end + var->left_margin;
> -	hblank_start =3D hactive;
> -	hblank_end =3D htotal;
> -
> -	DBG_MSG("H: act %d, ss %d, se %d, tot %d bs %d, be %d\n",
> -		hactive, hsync_start, hsync_end, htotal, hblank_start,
> -		hblank_end);
> -
> -	vactive =3D var->yres;
> -	if (var->vmode & FB_VMODE_INTERLACED)
> -		vactive--; /* the chip adds 2 halflines automatically */
> -	vsync_start =3D vactive + var->lower_margin;
> -	vsync_end =3D vsync_start + var->vsync_len;
> -	vtotal =3D vsync_end + var->upper_margin;
> -	vblank_start =3D vactive;
> -	vblank_end =3D vsync_end + 1;
> -
> -	DBG_MSG("V: act %d, ss %d, se %d, tot %d bs %d, be %d\n",
> -		vactive, vsync_start, vsync_end, vtotal, vblank_start,
> -		vblank_end);
> -
> -	/* Adjust for register values, and check for overflow. */
> -	hactive--;
> -	if (check_overflow(hactive, HACTIVE_MASK, "CRTC hactive"))
> -		return 1;
> -	hsync_start--;
> -	if (check_overflow(hsync_start, HSYNCSTART_MASK, "CRTC hsync_start"))
> -		return 1;
> -	hsync_end--;
> -	if (check_overflow(hsync_end, HSYNCEND_MASK, "CRTC hsync_end"))
> -		return 1;
> -	htotal--;
> -	if (check_overflow(htotal, HTOTAL_MASK, "CRTC htotal"))
> -		return 1;
> -	hblank_start--;
> -	if (check_overflow(hblank_start, HBLANKSTART_MASK, "CRTC hblank_start"))
> -		return 1;
> -	hblank_end--;
> -	if (check_overflow(hblank_end, HBLANKEND_MASK, "CRTC hblank_end"))
> -		return 1;
> -
> -	vactive--;
> -	if (check_overflow(vactive, VACTIVE_MASK, "CRTC vactive"))
> -		return 1;
> -	vsync_start--;
> -	if (check_overflow(vsync_start, VSYNCSTART_MASK, "CRTC vsync_start"))
> -		return 1;
> -	vsync_end--;
> -	if (check_overflow(vsync_end, VSYNCEND_MASK, "CRTC vsync_end"))
> -		return 1;
> -	vtotal--;
> -	if (check_overflow(vtotal, VTOTAL_MASK, "CRTC vtotal"))
> -		return 1;
> -	vblank_start--;
> -	if (check_overflow(vblank_start, VBLANKSTART_MASK, "CRTC vblank_start"))
> -		return 1;
> -	vblank_end--;
> -	if (check_overflow(vblank_end, VBLANKEND_MASK, "CRTC vblank_end"))
> -		return 1;
> -
> -	*ht =3D (htotal << HTOTAL_SHIFT) | (hactive << HACTIVE_SHIFT);
> -	*hb =3D (hblank_start << HBLANKSTART_SHIFT) |
> -	      (hblank_end << HSYNCEND_SHIFT);
> -	*hs =3D (hsync_start << HSYNCSTART_SHIFT) | (hsync_end << HSYNCEND_SHIF=
T);
> -
> -	*vt =3D (vtotal << VTOTAL_SHIFT) | (vactive << VACTIVE_SHIFT);
> -	*vb =3D (vblank_start << VBLANKSTART_SHIFT) |
> -	      (vblank_end << VSYNCEND_SHIFT);
> -	*vs =3D (vsync_start << VSYNCSTART_SHIFT) | (vsync_end << VSYNCEND_SHIF=
T);
> -	*ss =3D (hactive << SRC_SIZE_HORIZ_SHIFT) |
> -	      (vactive << SRC_SIZE_VERT_SHIFT);
> -
> -	hw->disp_a_stride =3D dinfo->pitch;
> -	DBG_MSG("pitch is %d\n", hw->disp_a_stride);
> -
> -	hw->disp_a_base =3D hw->disp_a_stride * var->yoffset +
> -			  var->xoffset * var->bits_per_pixel / 8;
> -
> -	hw->disp_a_base +=3D dinfo->fb.offset << 12;
> -
> -	/* Check stride alignment. */
> -	stride_alignment =3D IS_I9XX(dinfo) ? STRIDE_ALIGNMENT_I9XX :
> -					    STRIDE_ALIGNMENT;
> -	if (hw->disp_a_stride % stride_alignment !=3D 0) {
> -		WRN_MSG("display stride %d has bad alignment %d\n",
> -			hw->disp_a_stride, stride_alignment);
> -		return 1;
> -	}
> -
> -	/* Set the palette to 8-bit mode. */
> -	*pipe_conf &=3D ~PIPECONF_GAMMA;
> -
> -	if (var->vmode & FB_VMODE_INTERLACED)
> -		*pipe_conf |=3D PIPECONF_INTERLACE_W_FIELD_INDICATION;
> -	else
> -		*pipe_conf &=3D ~PIPECONF_INTERLACE_MASK;
> -
> -	return 0;
> -}
> -
> -/* Program a (non-VGA) video mode. */
> -int intelfbhw_program_mode(struct intelfb_info *dinfo,
> -			   const struct intelfb_hwstate *hw, int blank)
> -{
> -	u32 tmp;
> -	const u32 *dpll, *fp0, *fp1, *pipe_conf;
> -	const u32 *hs, *ht, *hb, *vs, *vt, *vb, *ss;
> -	u32 dpll_reg, fp0_reg, fp1_reg, pipe_conf_reg, pipe_stat_reg;
> -	u32 hsync_reg, htotal_reg, hblank_reg;
> -	u32 vsync_reg, vtotal_reg, vblank_reg;
> -	u32 src_size_reg;
> -	u32 count, tmp_val[3];
> -
> -	/* Assume single pipe */
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_program_mode\n");
> -#endif
> -
> -	/* Disable VGA */
> -	tmp =3D INREG(VGACNTRL);
> -	tmp |=3D VGA_DISABLE;
> -	OUTREG(VGACNTRL, tmp);
> -
> -	dinfo->pipe =3D intelfbhw_active_pipe(hw);
> -
> -	if (dinfo->pipe =3D=3D PIPE_B) {
> -		dpll =3D &hw->dpll_b;
> -		fp0 =3D &hw->fpb0;
> -		fp1 =3D &hw->fpb1;
> -		pipe_conf =3D &hw->pipe_b_conf;
> -		hs =3D &hw->hsync_b;
> -		hb =3D &hw->hblank_b;
> -		ht =3D &hw->htotal_b;
> -		vs =3D &hw->vsync_b;
> -		vb =3D &hw->vblank_b;
> -		vt =3D &hw->vtotal_b;
> -		ss =3D &hw->src_size_b;
> -		dpll_reg =3D DPLL_B;
> -		fp0_reg =3D FPB0;
> -		fp1_reg =3D FPB1;
> -		pipe_conf_reg =3D PIPEBCONF;
> -		pipe_stat_reg =3D PIPEBSTAT;
> -		hsync_reg =3D HSYNC_B;
> -		htotal_reg =3D HTOTAL_B;
> -		hblank_reg =3D HBLANK_B;
> -		vsync_reg =3D VSYNC_B;
> -		vtotal_reg =3D VTOTAL_B;
> -		vblank_reg =3D VBLANK_B;
> -		src_size_reg =3D SRC_SIZE_B;
> -	} else {
> -		dpll =3D &hw->dpll_a;
> -		fp0 =3D &hw->fpa0;
> -		fp1 =3D &hw->fpa1;
> -		pipe_conf =3D &hw->pipe_a_conf;
> -		hs =3D &hw->hsync_a;
> -		hb =3D &hw->hblank_a;
> -		ht =3D &hw->htotal_a;
> -		vs =3D &hw->vsync_a;
> -		vb =3D &hw->vblank_a;
> -		vt =3D &hw->vtotal_a;
> -		ss =3D &hw->src_size_a;
> -		dpll_reg =3D DPLL_A;
> -		fp0_reg =3D FPA0;
> -		fp1_reg =3D FPA1;
> -		pipe_conf_reg =3D PIPEACONF;
> -		pipe_stat_reg =3D PIPEASTAT;
> -		hsync_reg =3D HSYNC_A;
> -		htotal_reg =3D HTOTAL_A;
> -		hblank_reg =3D HBLANK_A;
> -		vsync_reg =3D VSYNC_A;
> -		vtotal_reg =3D VTOTAL_A;
> -		vblank_reg =3D VBLANK_A;
> -		src_size_reg =3D SRC_SIZE_A;
> -	}
> -
> -	/* turn off pipe */
> -	tmp =3D INREG(pipe_conf_reg);
> -	tmp &=3D ~PIPECONF_ENABLE;
> -	OUTREG(pipe_conf_reg, tmp);
> -
> -	count =3D 0;
> -	do {
> -		tmp_val[count % 3] =3D INREG(PIPEA_DSL);
> -		if ((tmp_val[0] =3D=3D tmp_val[1]) && (tmp_val[1] =3D=3D tmp_val[2]))
> -			break;
> -		count++;
> -		udelay(1);
> -		if (count % 200 =3D=3D 0) {
> -			tmp =3D INREG(pipe_conf_reg);
> -			tmp &=3D ~PIPECONF_ENABLE;
> -			OUTREG(pipe_conf_reg, tmp);
> -		}
> -	} while (count < 2000);
> -
> -	OUTREG(ADPA, INREG(ADPA) & ~ADPA_DAC_ENABLE);
> -
> -	/* Disable planes A and B. */
> -	tmp =3D INREG(DSPACNTR);
> -	tmp &=3D ~DISPPLANE_PLANE_ENABLE;
> -	OUTREG(DSPACNTR, tmp);
> -	tmp =3D INREG(DSPBCNTR);
> -	tmp &=3D ~DISPPLANE_PLANE_ENABLE;
> -	OUTREG(DSPBCNTR, tmp);
> -
> -	/* Wait for vblank. For now, just wait for a 50Hz cycle (20ms)) */
> -	mdelay(20);
> -
> -	OUTREG(DVOB, INREG(DVOB) & ~PORT_ENABLE);
> -	OUTREG(DVOC, INREG(DVOC) & ~PORT_ENABLE);
> -	OUTREG(ADPA, INREG(ADPA) & ~ADPA_DAC_ENABLE);
> -
> -	/* Disable Sync */
> -	tmp =3D INREG(ADPA);
> -	tmp &=3D ~ADPA_DPMS_CONTROL_MASK;
> -	tmp |=3D ADPA_DPMS_D3;
> -	OUTREG(ADPA, tmp);
> -
> -	/* do some funky magic - xyzzy */
> -	OUTREG(0x61204, 0xabcd0000);
> -
> -	/* turn off PLL */
> -	tmp =3D INREG(dpll_reg);
> -	tmp &=3D ~DPLL_VCO_ENABLE;
> -	OUTREG(dpll_reg, tmp);
> -
> -	/* Set PLL parameters */
> -	OUTREG(fp0_reg, *fp0);
> -	OUTREG(fp1_reg, *fp1);
> -
> -	/* Enable PLL */
> -	OUTREG(dpll_reg, *dpll);
> -
> -	/* Set DVOs B/C */
> -	OUTREG(DVOB, hw->dvob);
> -	OUTREG(DVOC, hw->dvoc);
> -
> -	/* undo funky magic */
> -	OUTREG(0x61204, 0x00000000);
> -
> -	/* Set ADPA */
> -	OUTREG(ADPA, INREG(ADPA) | ADPA_DAC_ENABLE);
> -	OUTREG(ADPA, (hw->adpa & ~(ADPA_DPMS_CONTROL_MASK)) | ADPA_DPMS_D3);
> -
> -	/* Set pipe parameters */
> -	OUTREG(hsync_reg, *hs);
> -	OUTREG(hblank_reg, *hb);
> -	OUTREG(htotal_reg, *ht);
> -	OUTREG(vsync_reg, *vs);
> -	OUTREG(vblank_reg, *vb);
> -	OUTREG(vtotal_reg, *vt);
> -	OUTREG(src_size_reg, *ss);
> -
> -	switch (dinfo->info->var.vmode & (FB_VMODE_INTERLACED |
> -					  FB_VMODE_ODD_FLD_FIRST)) {
> -	case FB_VMODE_INTERLACED | FB_VMODE_ODD_FLD_FIRST:
> -		OUTREG(pipe_stat_reg, 0xFFFF | PIPESTAT_FLD_EVT_ODD_EN);
> -		break;
> -	case FB_VMODE_INTERLACED: /* even lines first */
> -		OUTREG(pipe_stat_reg, 0xFFFF | PIPESTAT_FLD_EVT_EVEN_EN);
> -		break;
> -	default:		/* non-interlaced */
> -		OUTREG(pipe_stat_reg, 0xFFFF); /* clear all status bits only */
> -	}
> -	/* Enable pipe */
> -	OUTREG(pipe_conf_reg, *pipe_conf | PIPECONF_ENABLE);
> -
> -	/* Enable sync */
> -	tmp =3D INREG(ADPA);
> -	tmp &=3D ~ADPA_DPMS_CONTROL_MASK;
> -	tmp |=3D ADPA_DPMS_D0;
> -	OUTREG(ADPA, tmp);
> -
> -	/* setup display plane */
> -	if (dinfo->pdev->device =3D=3D PCI_DEVICE_ID_INTEL_830M) {
> -		/*
> -		 *      i830M errata: the display plane must be enabled
> -		 *      to allow writes to the other bits in the plane
> -		 *      control register.
> -		 */
> -		tmp =3D INREG(DSPACNTR);
> -		if ((tmp & DISPPLANE_PLANE_ENABLE) !=3D DISPPLANE_PLANE_ENABLE) {
> -			tmp |=3D DISPPLANE_PLANE_ENABLE;
> -			OUTREG(DSPACNTR, tmp);
> -			OUTREG(DSPACNTR,
> -			       hw->disp_a_ctrl|DISPPLANE_PLANE_ENABLE);
> -			mdelay(1);
> -		}
> -	}
> -
> -	OUTREG(DSPACNTR, hw->disp_a_ctrl & ~DISPPLANE_PLANE_ENABLE);
> -	OUTREG(DSPASTRIDE, hw->disp_a_stride);
> -	OUTREG(DSPABASE, hw->disp_a_base);
> -
> -	/* Enable plane */
> -	if (!blank) {
> -		tmp =3D INREG(DSPACNTR);
> -		tmp |=3D DISPPLANE_PLANE_ENABLE;
> -		OUTREG(DSPACNTR, tmp);
> -		OUTREG(DSPABASE, hw->disp_a_base);
> -	}
> -
> -	return 0;
> -}
> -
> -/* forward declarations */
> -static void refresh_ring(struct intelfb_info *dinfo);
> -static void reset_state(struct intelfb_info *dinfo);
> -static void do_flush(struct intelfb_info *dinfo);
> -
> -static  u32 get_ring_space(struct intelfb_info *dinfo)
> -{
> -	u32 ring_space;
> -
> -	if (dinfo->ring_tail >=3D dinfo->ring_head)
> -		ring_space =3D dinfo->ring.size -
> -			(dinfo->ring_tail - dinfo->ring_head);
> -	else
> -		ring_space =3D dinfo->ring_head - dinfo->ring_tail;
> -
> -	if (ring_space > RING_MIN_FREE)
> -		ring_space -=3D RING_MIN_FREE;
> -	else
> -		ring_space =3D 0;
> -
> -	return ring_space;
> -}
> -
> -static int wait_ring(struct intelfb_info *dinfo, int n)
> -{
> -	int i =3D 0;
> -	unsigned long end;
> -	u32 last_head =3D INREG(PRI_RING_HEAD) & RING_HEAD_MASK;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("wait_ring: %d\n", n);
> -#endif
> -
> -	end =3D jiffies + (HZ * 3);
> -	while (dinfo->ring_space < n) {
> -		dinfo->ring_head =3D INREG(PRI_RING_HEAD) & RING_HEAD_MASK;
> -		dinfo->ring_space =3D get_ring_space(dinfo);
> -
> -		if (dinfo->ring_head !=3D last_head) {
> -			end =3D jiffies + (HZ * 3);
> -			last_head =3D dinfo->ring_head;
> -		}
> -		i++;
> -		if (time_before(end, jiffies)) {
> -			if (!i) {
> -				/* Try again */
> -				reset_state(dinfo);
> -				refresh_ring(dinfo);
> -				do_flush(dinfo);
> -				end =3D jiffies + (HZ * 3);
> -				i =3D 1;
> -			} else {
> -				WRN_MSG("ring buffer : space: %d wanted %d\n",
> -					dinfo->ring_space, n);
> -				WRN_MSG("lockup - turning off hardware "
> -					"acceleration\n");
> -				dinfo->ring_lockup =3D 1;
> -				break;
> -			}
> -		}
> -		udelay(1);
> -	}
> -	return i;
> -}
> -
> -static void do_flush(struct intelfb_info *dinfo)
> -{
> -	START_RING(2);
> -	OUT_RING(MI_FLUSH | MI_WRITE_DIRTY_STATE | MI_INVALIDATE_MAP_CACHE);
> -	OUT_RING(MI_NOOP);
> -	ADVANCE_RING();
> -}
> -
> -void intelfbhw_do_sync(struct intelfb_info *dinfo)
> -{
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_do_sync\n");
> -#endif
> -
> -	if (!dinfo->accel)
> -		return;
> -
> -	/*
> -	 * Send a flush, then wait until the ring is empty.  This is what
> -	 * the XFree86 driver does, and actually it doesn't seem a lot worse
> -	 * than the recommended method (both have problems).
> -	 */
> -	do_flush(dinfo);
> -	wait_ring(dinfo, dinfo->ring.size - RING_MIN_FREE);
> -	dinfo->ring_space =3D dinfo->ring.size - RING_MIN_FREE;
> -}
> -
> -static void refresh_ring(struct intelfb_info *dinfo)
> -{
> -#if VERBOSE > 0
> -	DBG_MSG("refresh_ring\n");
> -#endif
> -
> -	dinfo->ring_head =3D INREG(PRI_RING_HEAD) & RING_HEAD_MASK;
> -	dinfo->ring_tail =3D INREG(PRI_RING_TAIL) & RING_TAIL_MASK;
> -	dinfo->ring_space =3D get_ring_space(dinfo);
> -}
> -
> -static void reset_state(struct intelfb_info *dinfo)
> -{
> -	int i;
> -	u32 tmp;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("reset_state\n");
> -#endif
> -
> -	for (i =3D 0; i < FENCE_NUM; i++)
> -		OUTREG(FENCE + (i << 2), 0);
> -
> -	/* Flush the ring buffer if it's enabled. */
> -	tmp =3D INREG(PRI_RING_LENGTH);
> -	if (tmp & RING_ENABLE) {
> -#if VERBOSE > 0
> -		DBG_MSG("reset_state: ring was enabled\n");
> -#endif
> -		refresh_ring(dinfo);
> -		intelfbhw_do_sync(dinfo);
> -		DO_RING_IDLE();
> -	}
> -
> -	OUTREG(PRI_RING_LENGTH, 0);
> -	OUTREG(PRI_RING_HEAD, 0);
> -	OUTREG(PRI_RING_TAIL, 0);
> -	OUTREG(PRI_RING_START, 0);
> -}
> -
> -/* Stop the 2D engine, and turn off the ring buffer. */
> -void intelfbhw_2d_stop(struct intelfb_info *dinfo)
> -{
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_2d_stop: accel: %d, ring_active: %d\n",
> -		dinfo->accel, dinfo->ring_active);
> -#endif
> -
> -	if (!dinfo->accel)
> -		return;
> -
> -	dinfo->ring_active =3D 0;
> -	reset_state(dinfo);
> -}
> -
> -/*
> - * Enable the ring buffer, and initialise the 2D engine.
> - * It is assumed that the graphics engine has been stopped by previously
> - * calling intelfb_2d_stop().
> - */
> -void intelfbhw_2d_start(struct intelfb_info *dinfo)
> -{
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_2d_start: accel: %d, ring_active: %d\n",
> -		dinfo->accel, dinfo->ring_active);
> -#endif
> -
> -	if (!dinfo->accel)
> -		return;
> -
> -	/* Initialise the primary ring buffer. */
> -	OUTREG(PRI_RING_LENGTH, 0);
> -	OUTREG(PRI_RING_TAIL, 0);
> -	OUTREG(PRI_RING_HEAD, 0);
> -
> -	OUTREG(PRI_RING_START, dinfo->ring.physical & RING_START_MASK);
> -	OUTREG(PRI_RING_LENGTH,
> -		((dinfo->ring.size - GTT_PAGE_SIZE) & RING_LENGTH_MASK) |
> -		RING_NO_REPORT | RING_ENABLE);
> -	refresh_ring(dinfo);
> -	dinfo->ring_active =3D 1;
> -}
> -
> -/* 2D fillrect (solid fill or invert) */
> -void intelfbhw_do_fillrect(struct intelfb_info *dinfo, u32 x, u32 y, u32=
 w,
> -			   u32 h, u32 color, u32 pitch, u32 bpp, u32 rop)
> -{
> -	u32 br00, br09, br13, br14, br16;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_do_fillrect: (%d,%d) %dx%d, c 0x%06x, p %d bpp %d, "
> -		"rop 0x%02x\n", x, y, w, h, color, pitch, bpp, rop);
> -#endif
> -
> -	br00 =3D COLOR_BLT_CMD;
> -	br09 =3D dinfo->fb_start + (y * pitch + x * (bpp / 8));
> -	br13 =3D (rop << ROP_SHIFT) | pitch;
> -	br14 =3D (h << HEIGHT_SHIFT) | ((w * (bpp / 8)) << WIDTH_SHIFT);
> -	br16 =3D color;
> -
> -	switch (bpp) {
> -	case 8:
> -		br13 |=3D COLOR_DEPTH_8;
> -		break;
> -	case 16:
> -		br13 |=3D COLOR_DEPTH_16;
> -		break;
> -	case 32:
> -		br13 |=3D COLOR_DEPTH_32;
> -		br00 |=3D WRITE_ALPHA | WRITE_RGB;
> -		break;
> -	}
> -
> -	START_RING(6);
> -	OUT_RING(br00);
> -	OUT_RING(br13);
> -	OUT_RING(br14);
> -	OUT_RING(br09);
> -	OUT_RING(br16);
> -	OUT_RING(MI_NOOP);
> -	ADVANCE_RING();
> -
> -#if VERBOSE > 0
> -	DBG_MSG("ring =3D 0x%08x, 0x%08x (%d)\n", dinfo->ring_head,
> -		dinfo->ring_tail, dinfo->ring_space);
> -#endif
> -}
> -
> -void
> -intelfbhw_do_bitblt(struct intelfb_info *dinfo, u32 curx, u32 cury,
> -		    u32 dstx, u32 dsty, u32 w, u32 h, u32 pitch, u32 bpp)
> -{
> -	u32 br00, br09, br11, br12, br13, br22, br23, br26;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_do_bitblt: (%d,%d)->(%d,%d) %dx%d, p %d bpp %d\n",
> -		curx, cury, dstx, dsty, w, h, pitch, bpp);
> -#endif
> -
> -	br00 =3D XY_SRC_COPY_BLT_CMD;
> -	br09 =3D dinfo->fb_start;
> -	br11 =3D (pitch << PITCH_SHIFT);
> -	br12 =3D dinfo->fb_start;
> -	br13 =3D (SRC_ROP_GXCOPY << ROP_SHIFT) | (pitch << PITCH_SHIFT);
> -	br22 =3D (dstx << WIDTH_SHIFT) | (dsty << HEIGHT_SHIFT);
> -	br23 =3D ((dstx + w) << WIDTH_SHIFT) |
> -	       ((dsty + h) << HEIGHT_SHIFT);
> -	br26 =3D (curx << WIDTH_SHIFT) | (cury << HEIGHT_SHIFT);
> -
> -	switch (bpp) {
> -	case 8:
> -		br13 |=3D COLOR_DEPTH_8;
> -		break;
> -	case 16:
> -		br13 |=3D COLOR_DEPTH_16;
> -		break;
> -	case 32:
> -		br13 |=3D COLOR_DEPTH_32;
> -		br00 |=3D WRITE_ALPHA | WRITE_RGB;
> -		break;
> -	}
> -
> -	START_RING(8);
> -	OUT_RING(br00);
> -	OUT_RING(br13);
> -	OUT_RING(br22);
> -	OUT_RING(br23);
> -	OUT_RING(br09);
> -	OUT_RING(br26);
> -	OUT_RING(br11);
> -	OUT_RING(br12);
> -	ADVANCE_RING();
> -}
> -
> -int intelfbhw_do_drawglyph(struct intelfb_info *dinfo, u32 fg, u32 bg, u=
32 w,
> -			   u32 h, const u8* cdat, u32 x, u32 y, u32 pitch,
> -			   u32 bpp)
> -{
> -	int nbytes, ndwords, pad, tmp;
> -	u32 br00, br09, br13, br18, br19, br22, br23;
> -	int dat, ix, iy, iw;
> -	int i, j;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_do_drawglyph: (%d,%d) %dx%d\n", x, y, w, h);
> -#endif
> -
> -	/* size in bytes of a padded scanline */
> -	nbytes =3D ROUND_UP_TO(w, 16) / 8;
> -
> -	/* Total bytes of padded scanline data to write out. */
> -	nbytes =3D nbytes * h;
> -
> -	/*
> -	 * Check if the glyph data exceeds the immediate mode limit.
> -	 * It would take a large font (1K pixels) to hit this limit.
> -	 */
> -	if (nbytes > MAX_MONO_IMM_SIZE)
> -		return 0;
> -
> -	/* Src data is packaged a dword (32-bit) at a time. */
> -	ndwords =3D ROUND_UP_TO(nbytes, 4) / 4;
> -
> -	/*
> -	 * Ring has to be padded to a quad word. But because the command starts
> -	   with 7 bytes, pad only if there is an even number of ndwords
> -	 */
> -	pad =3D !(ndwords % 2);
> -
> -	tmp =3D (XY_MONO_SRC_IMM_BLT_CMD & DW_LENGTH_MASK) + ndwords;
> -	br00 =3D (XY_MONO_SRC_IMM_BLT_CMD & ~DW_LENGTH_MASK) | tmp;
> -	br09 =3D dinfo->fb_start;
> -	br13 =3D (SRC_ROP_GXCOPY << ROP_SHIFT) | (pitch << PITCH_SHIFT);
> -	br18 =3D bg;
> -	br19 =3D fg;
> -	br22 =3D (x << WIDTH_SHIFT) | (y << HEIGHT_SHIFT);
> -	br23 =3D ((x + w) << WIDTH_SHIFT) | ((y + h) << HEIGHT_SHIFT);
> -
> -	switch (bpp) {
> -	case 8:
> -		br13 |=3D COLOR_DEPTH_8;
> -		break;
> -	case 16:
> -		br13 |=3D COLOR_DEPTH_16;
> -		break;
> -	case 32:
> -		br13 |=3D COLOR_DEPTH_32;
> -		br00 |=3D WRITE_ALPHA | WRITE_RGB;
> -		break;
> -	}
> -
> -	START_RING(8 + ndwords);
> -	OUT_RING(br00);
> -	OUT_RING(br13);
> -	OUT_RING(br22);
> -	OUT_RING(br23);
> -	OUT_RING(br09);
> -	OUT_RING(br18);
> -	OUT_RING(br19);
> -	ix =3D iy =3D 0;
> -	iw =3D ROUND_UP_TO(w, 8) / 8;
> -	while (ndwords--) {
> -		dat =3D 0;
> -		for (j =3D 0; j < 2; ++j) {
> -			for (i =3D 0; i < 2; ++i) {
> -				if (ix !=3D iw || i =3D=3D 0)
> -					dat |=3D cdat[iy*iw + ix++] << (i+j*2)*8;
> -			}
> -			if (ix =3D=3D iw && iy !=3D (h-1)) {
> -				ix =3D 0;
> -				++iy;
> -			}
> -		}
> -		OUT_RING(dat);
> -	}
> -	if (pad)
> -		OUT_RING(MI_NOOP);
> -	ADVANCE_RING();
> -
> -	return 1;
> -}
> -
> -/* HW cursor functions. */
> -void intelfbhw_cursor_init(struct intelfb_info *dinfo)
> -{
> -	u32 tmp;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_cursor_init\n");
> -#endif
> -
> -	if (dinfo->mobile || IS_I9XX(dinfo)) {
> -		if (!dinfo->cursor.physical)
> -			return;
> -		tmp =3D INREG(CURSOR_A_CONTROL);
> -		tmp &=3D ~(CURSOR_MODE_MASK | CURSOR_MOBILE_GAMMA_ENABLE |
> -			 CURSOR_MEM_TYPE_LOCAL |
> -			 (1 << CURSOR_PIPE_SELECT_SHIFT));
> -		tmp |=3D CURSOR_MODE_DISABLE;
> -		OUTREG(CURSOR_A_CONTROL, tmp);
> -		OUTREG(CURSOR_A_BASEADDR, dinfo->cursor.physical);
> -	} else {
> -		tmp =3D INREG(CURSOR_CONTROL);
> -		tmp &=3D ~(CURSOR_FORMAT_MASK | CURSOR_GAMMA_ENABLE |
> -			 CURSOR_ENABLE | CURSOR_STRIDE_MASK);
> -		tmp |=3D CURSOR_FORMAT_3C;
> -		OUTREG(CURSOR_CONTROL, tmp);
> -		OUTREG(CURSOR_A_BASEADDR, dinfo->cursor.offset << 12);
> -		tmp =3D (64 << CURSOR_SIZE_H_SHIFT) |
> -		      (64 << CURSOR_SIZE_V_SHIFT);
> -		OUTREG(CURSOR_SIZE, tmp);
> -	}
> -}
> -
> -void intelfbhw_cursor_hide(struct intelfb_info *dinfo)
> -{
> -	u32 tmp;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_cursor_hide\n");
> -#endif
> -
> -	dinfo->cursor_on =3D 0;
> -	if (dinfo->mobile || IS_I9XX(dinfo)) {
> -		if (!dinfo->cursor.physical)
> -			return;
> -		tmp =3D INREG(CURSOR_A_CONTROL);
> -		tmp &=3D ~CURSOR_MODE_MASK;
> -		tmp |=3D CURSOR_MODE_DISABLE;
> -		OUTREG(CURSOR_A_CONTROL, tmp);
> -		/* Flush changes */
> -		OUTREG(CURSOR_A_BASEADDR, dinfo->cursor.physical);
> -	} else {
> -		tmp =3D INREG(CURSOR_CONTROL);
> -		tmp &=3D ~CURSOR_ENABLE;
> -		OUTREG(CURSOR_CONTROL, tmp);
> -	}
> -}
> -
> -void intelfbhw_cursor_show(struct intelfb_info *dinfo)
> -{
> -	u32 tmp;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_cursor_show\n");
> -#endif
> -
> -	dinfo->cursor_on =3D 1;
> -
> -	if (dinfo->cursor_blanked)
> -		return;
> -
> -	if (dinfo->mobile || IS_I9XX(dinfo)) {
> -		if (!dinfo->cursor.physical)
> -			return;
> -		tmp =3D INREG(CURSOR_A_CONTROL);
> -		tmp &=3D ~CURSOR_MODE_MASK;
> -		tmp |=3D CURSOR_MODE_64_4C_AX;
> -		OUTREG(CURSOR_A_CONTROL, tmp);
> -		/* Flush changes */
> -		OUTREG(CURSOR_A_BASEADDR, dinfo->cursor.physical);
> -	} else {
> -		tmp =3D INREG(CURSOR_CONTROL);
> -		tmp |=3D CURSOR_ENABLE;
> -		OUTREG(CURSOR_CONTROL, tmp);
> -	}
> -}
> -
> -void intelfbhw_cursor_setpos(struct intelfb_info *dinfo, int x, int y)
> -{
> -	u32 tmp;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_cursor_setpos: (%d, %d)\n", x, y);
> -#endif
> -
> -	/*
> -	 * Sets the position. The coordinates are assumed to already
> -	 * have any offset adjusted. Assume that the cursor is never
> -	 * completely off-screen, and that x, y are always >=3D 0.
> -	 */
> -
> -	tmp =3D ((x & CURSOR_POS_MASK) << CURSOR_X_SHIFT) |
> -	      ((y & CURSOR_POS_MASK) << CURSOR_Y_SHIFT);
> -	OUTREG(CURSOR_A_POSITION, tmp);
> -
> -	if (IS_I9XX(dinfo))
> -		OUTREG(CURSOR_A_BASEADDR, dinfo->cursor.physical);
> -}
> -
> -void intelfbhw_cursor_setcolor(struct intelfb_info *dinfo, u32 bg, u32 f=
g)
> -{
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_cursor_setcolor\n");
> -#endif
> -
> -	OUTREG(CURSOR_A_PALETTE0, bg & CURSOR_PALETTE_MASK);
> -	OUTREG(CURSOR_A_PALETTE1, fg & CURSOR_PALETTE_MASK);
> -	OUTREG(CURSOR_A_PALETTE2, fg & CURSOR_PALETTE_MASK);
> -	OUTREG(CURSOR_A_PALETTE3, bg & CURSOR_PALETTE_MASK);
> -}
> -
> -void intelfbhw_cursor_load(struct intelfb_info *dinfo, int width, int he=
ight,
> -			   u8 *data)
> -{
> -	u8 __iomem *addr =3D (u8 __iomem *)dinfo->cursor.virtual;
> -	int i, j, w =3D width / 8;
> -	int mod =3D width % 8, t_mask, d_mask;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_cursor_load\n");
> -#endif
> -
> -	if (!dinfo->cursor.virtual)
> -		return;
> -
> -	t_mask =3D 0xff >> mod;
> -	d_mask =3D ~(0xff >> mod);
> -	for (i =3D height; i--; ) {
> -		for (j =3D 0; j < w; j++) {
> -			writeb(0x00, addr + j);
> -			writeb(*(data++), addr + j+8);
> -		}
> -		if (mod) {
> -			writeb(t_mask, addr + j);
> -			writeb(*(data++) & d_mask, addr + j+8);
> -		}
> -		addr +=3D 16;
> -	}
> -}
> -
> -void intelfbhw_cursor_reset(struct intelfb_info *dinfo)
> -{
> -	u8 __iomem *addr =3D (u8 __iomem *)dinfo->cursor.virtual;
> -	int i, j;
> -
> -#if VERBOSE > 0
> -	DBG_MSG("intelfbhw_cursor_reset\n");
> -#endif
> -
> -	if (!dinfo->cursor.virtual)
> -		return;
> -
> -	for (i =3D 64; i--; ) {
> -		for (j =3D 0; j < 8; j++) {
> -			writeb(0xff, addr + j+0);
> -			writeb(0x00, addr + j+8);
> -		}
> -		addr +=3D 16;
> -	}
> -}
> -
> -static irqreturn_t intelfbhw_irq(int irq, void *dev_id)
> -{
> -	u16 tmp;
> -	struct intelfb_info *dinfo =3D dev_id;
> -
> -	spin_lock(&dinfo->int_lock);
> -
> -	tmp =3D INREG16(IIR);
> -	if (dinfo->info->var.vmode & FB_VMODE_INTERLACED)
> -		tmp &=3D PIPE_A_EVENT_INTERRUPT;
> -	else
> -		tmp &=3D VSYNC_PIPE_A_INTERRUPT; /* non-interlaced */
> -
> -	if (tmp =3D=3D 0) {
> -		spin_unlock(&dinfo->int_lock);
> -		return IRQ_RETVAL(0); /* not us */
> -	}
> -
> -	/* clear status bits 0-15 ASAP and don't touch bits 16-31 */
> -	OUTREG(PIPEASTAT, INREG(PIPEASTAT));
> -
> -	OUTREG16(IIR, tmp);
> -	if (dinfo->vsync.pan_display) {
> -		dinfo->vsync.pan_display =3D 0;
> -		OUTREG(DSPABASE, dinfo->vsync.pan_offset);
> -	}
> -
> -	dinfo->vsync.count++;
> -	wake_up_interruptible(&dinfo->vsync.wait);
> -
> -	spin_unlock(&dinfo->int_lock);
> -
> -	return IRQ_RETVAL(1);
> -}
> -
> -int intelfbhw_enable_irq(struct intelfb_info *dinfo)
> -{
> -	u16 tmp;
> -	if (!test_and_set_bit(0, &dinfo->irq_flags)) {
> -		if (request_irq(dinfo->pdev->irq, intelfbhw_irq, IRQF_SHARED,
> -				"intelfb", dinfo)) {
> -			clear_bit(0, &dinfo->irq_flags);
> -			return -EINVAL;
> -		}
> -
> -		spin_lock_irq(&dinfo->int_lock);
> -		OUTREG16(HWSTAM, 0xfffe); /* i830 DRM uses ffff */
> -		OUTREG16(IMR, 0);
> -	} else
> -		spin_lock_irq(&dinfo->int_lock);
> -
> -	if (dinfo->info->var.vmode & FB_VMODE_INTERLACED)
> -		tmp =3D PIPE_A_EVENT_INTERRUPT;
> -	else
> -		tmp =3D VSYNC_PIPE_A_INTERRUPT; /* non-interlaced */
> -	if (tmp !=3D INREG16(IER)) {
> -		DBG_MSG("changing IER to 0x%X\n", tmp);
> -		OUTREG16(IER, tmp);
> -	}
> -
> -	spin_unlock_irq(&dinfo->int_lock);
> -	return 0;
> -}
> -
> -void intelfbhw_disable_irq(struct intelfb_info *dinfo)
> -{
> -	if (test_and_clear_bit(0, &dinfo->irq_flags)) {
> -		if (dinfo->vsync.pan_display) {
> -			dinfo->vsync.pan_display =3D 0;
> -			OUTREG(DSPABASE, dinfo->vsync.pan_offset);
> -		}
> -		spin_lock_irq(&dinfo->int_lock);
> -		OUTREG16(HWSTAM, 0xffff);
> -		OUTREG16(IMR, 0xffff);
> -		OUTREG16(IER, 0x0);
> -
> -		OUTREG16(IIR, INREG16(IIR)); /* clear IRQ requests */
> -		spin_unlock_irq(&dinfo->int_lock);
> -
> -		free_irq(dinfo->pdev->irq, dinfo);
> -	}
> -}
> -
> -int intelfbhw_wait_for_vsync(struct intelfb_info *dinfo, u32 pipe)
> -{
> -	struct intelfb_vsync *vsync;
> -	unsigned int count;
> -	int ret;
> -
> -	switch (pipe) {
> -		case 0:
> -			vsync =3D &dinfo->vsync;
> -			break;
> -		default:
> -			return -ENODEV;
> -	}
> -
> -	ret =3D intelfbhw_enable_irq(dinfo);
> -	if (ret)
> -		return ret;
> -
> -	count =3D vsync->count;
> -	ret =3D wait_event_interruptible_timeout(vsync->wait,
> -					       count !=3D vsync->count, HZ / 10);
> -	if (ret < 0)
> -		return ret;
> -	if (ret =3D=3D 0) {
> -		DBG_MSG("wait_for_vsync timed out!\n");
> -		return -ETIMEDOUT;
> -	}
> -
> -	return 0;
> -}
> diff --git a/drivers/video/fbdev/intelfb/intelfbhw.h b/drivers/video/fbde=
v/intelfb/intelfbhw.h
> deleted file mode 100644
> index 216ca20f259f..000000000000
> --- a/drivers/video/fbdev/intelfb/intelfbhw.h
> +++ /dev/null
> @@ -1,609 +0,0 @@
> -#ifndef _INTELFBHW_H
> -#define _INTELFBHW_H
> -
> -/* $DHD: intelfb/intelfbhw.h,v 1.5 2003/06/27 15:06:25 dawes Exp $ */
> -
> -
> -/*** HW-specific data ***/
> -
> -/* Information about the 852GM/855GM variants */
> -#define INTEL_85X_CAPID		0x44
> -#define INTEL_85X_VARIANT_MASK		0x7
> -#define INTEL_85X_VARIANT_SHIFT		5
> -#define INTEL_VAR_855GME		0x0
> -#define INTEL_VAR_855GM			0x4
> -#define INTEL_VAR_852GME		0x2
> -#define INTEL_VAR_852GM			0x5
> -
> -/* Information about DVO/LVDS Ports */
> -#define DVOA_PORT  0x1
> -#define DVOB_PORT  0x2
> -#define DVOC_PORT  0x4
> -#define LVDS_PORT  0x8
> -
> -/*
> - * The Bridge device's PCI config space has information about the
> - * fb aperture size and the amount of pre-reserved memory.
> - */
> -#define INTEL_GMCH_CTRL		0x52
> -#define INTEL_GMCH_ENABLED		0x4
> -#define INTEL_GMCH_MEM_MASK		0x1
> -#define INTEL_GMCH_MEM_64M		0x1
> -#define INTEL_GMCH_MEM_128M		0
> -
> -#define INTEL_830_GMCH_GMS_MASK		(0x7 << 4)
> -#define INTEL_830_GMCH_GMS_DISABLED	(0x0 << 4)
> -#define INTEL_830_GMCH_GMS_LOCAL	(0x1 << 4)
> -#define INTEL_830_GMCH_GMS_STOLEN_512	(0x2 << 4)
> -#define INTEL_830_GMCH_GMS_STOLEN_1024	(0x3 << 4)
> -#define INTEL_830_GMCH_GMS_STOLEN_8192	(0x4 << 4)
> -
> -#define INTEL_855_GMCH_GMS_MASK		(0x7 << 4)
> -#define INTEL_855_GMCH_GMS_DISABLED	(0x0 << 4)
> -#define INTEL_855_GMCH_GMS_STOLEN_1M	(0x1 << 4)
> -#define INTEL_855_GMCH_GMS_STOLEN_4M	(0x2 << 4)
> -#define INTEL_855_GMCH_GMS_STOLEN_8M	(0x3 << 4)
> -#define INTEL_855_GMCH_GMS_STOLEN_16M	(0x4 << 4)
> -#define INTEL_855_GMCH_GMS_STOLEN_32M	(0x5 << 4)
> -
> -#define INTEL_915G_GMCH_GMS_STOLEN_48M	(0x6 << 4)
> -#define INTEL_915G_GMCH_GMS_STOLEN_64M	(0x7 << 4)
> -
> -/* HW registers */
> -
> -/* Fence registers */
> -#define FENCE			0x2000
> -#define FENCE_NUM			8
> -
> -/* Primary ring buffer */
> -#define PRI_RING_TAIL		0x2030
> -#define RING_TAIL_MASK			0x001ffff8
> -#define RING_INUSE			0x1
> -
> -#define PRI_RING_HEAD		0x2034
> -#define RING_HEAD_WRAP_MASK		0x7ff
> -#define RING_HEAD_WRAP_SHIFT		21
> -#define RING_HEAD_MASK			0x001ffffc
> -
> -#define PRI_RING_START		0x2038
> -#define RING_START_MASK			0xfffff000
> -
> -#define PRI_RING_LENGTH		0x203c
> -#define RING_LENGTH_MASK		0x001ff000
> -#define RING_REPORT_MASK		(0x3 << 1)
> -#define RING_NO_REPORT			(0x0 << 1)
> -#define RING_REPORT_64K			(0x1 << 1)
> -#define RING_REPORT_4K			(0x2 << 1)
> -#define RING_REPORT_128K		(0x3 << 1)
> -#define RING_ENABLE			0x1
> -
> -/*
> - * Tail can't wrap to any closer than RING_MIN_FREE bytes of the head,
> - * and the last RING_MIN_FREE bytes need to be padded with MI_NOOP
> - */
> -#define RING_MIN_FREE			64
> -
> -#define IPEHR			0x2088
> -
> -#define INSTDONE		0x2090
> -#define PRI_RING_EMPTY			1
> -
> -#define HWSTAM			0x2098
> -#define IER			0x20A0
> -#define IIR			0x20A4
> -#define IMR			0x20A8
> -#define VSYNC_PIPE_A_INTERRUPT		(1 << 7)
> -#define PIPE_A_EVENT_INTERRUPT		(1 << 6)
> -#define VSYNC_PIPE_B_INTERRUPT		(1 << 5)
> -#define PIPE_B_EVENT_INTERRUPT		(1 << 4)
> -#define HOST_PORT_EVENT_INTERRUPT	(1 << 3)
> -#define CAPTURE_EVENT_INTERRUPT		(1 << 2)
> -#define USER_DEFINED_INTERRUPT		(1 << 1)
> -#define BREAKPOINT_INTERRUPT		1
> -
> -#define INSTPM			0x20c0
> -#define SYNC_FLUSH_ENABLE		(1 << 5)
> -
> -#define INSTPS			0x20c4
> -
> -#define MEM_MODE		0x20cc
> -
> -#define MASK_SHIFT			16
> -
> -#define FW_BLC_0		0x20d8
> -#define FW_DISPA_WM_SHIFT		0
> -#define FW_DISPA_WM_MASK		0x3f
> -#define FW_DISPA_BL_SHIFT		8
> -#define FW_DISPA_BL_MASK		0xf
> -#define FW_DISPB_WM_SHIFT		16
> -#define FW_DISPB_WM_MASK		0x1f
> -#define FW_DISPB_BL_SHIFT		24
> -#define FW_DISPB_BL_MASK		0x7
> -
> -#define FW_BLC_1		0x20dc
> -#define FW_DISPC_WM_SHIFT		0
> -#define FW_DISPC_WM_MASK		0x1f
> -#define FW_DISPC_BL_SHIFT		8
> -#define FW_DISPC_BL_MASK		0x7
> -
> -#define GPIOA             0x5010
> -#define GPIOB             0x5014
> -#define GPIOC             0x5018 /* this may be external DDC on i830 */
> -#define GPIOD             0x501C /* this is DVO DDC */
> -#define GPIOE             0x5020 /* this is DVO i2C */
> -#define GPIOF             0x5024
> -
> -/* PLL registers */
> -#define VGA0_DIVISOR		0x06000
> -#define VGA1_DIVISOR		0x06004
> -#define VGAPD			0x06010
> -#define VGAPD_0_P1_SHIFT		0
> -#define VGAPD_0_P1_FORCE_DIV2		(1 << 5)
> -#define VGAPD_0_P2_SHIFT		7
> -#define VGAPD_1_P1_SHIFT		8
> -#define VGAPD_1_P1_FORCE_DIV2		(1 << 13)
> -#define VGAPD_1_P2_SHIFT		15
> -
> -#define DPLL_A			0x06014
> -#define DPLL_B			0x06018
> -#define DPLL_VCO_ENABLE			(1 << 31)
> -#define DPLL_2X_CLOCK_ENABLE		(1 << 30)
> -#define DPLL_SYNCLOCK_ENABLE		(1 << 29)
> -#define DPLL_VGA_MODE_DISABLE		(1 << 28)
> -#define DPLL_P2_MASK			1
> -#define DPLL_P2_SHIFT			23
> -#define DPLL_I9XX_P2_SHIFT              24
> -#define DPLL_P1_FORCE_DIV2		(1 << 21)
> -#define DPLL_P1_MASK			0x1f
> -#define DPLL_P1_SHIFT			16
> -#define DPLL_REFERENCE_SELECT_MASK	(0x3 << 13)
> -#define DPLL_REFERENCE_DEFAULT		(0x0 << 13)
> -#define DPLL_REFERENCE_TVCLK		(0x2 << 13)
> -#define DPLL_RATE_SELECT_MASK		(1 << 8)
> -#define DPLL_RATE_SELECT_FP0		(0 << 8)
> -#define DPLL_RATE_SELECT_FP1		(1 << 8)
> -
> -#define FPA0			0x06040
> -#define FPA1			0x06044
> -#define FPB0			0x06048
> -#define FPB1			0x0604c
> -#define FP_DIVISOR_MASK			0x3f
> -#define FP_N_DIVISOR_SHIFT		16
> -#define FP_M1_DIVISOR_SHIFT		8
> -#define FP_M2_DIVISOR_SHIFT		0
> -
> -/* PLL parameters (these are for 852GM/855GM/865G, check earlier chips).=
 */
> -/* Clock values are in units of kHz */
> -#define PLL_REFCLK		48000
> -#define MIN_CLOCK		25000
> -#define MAX_CLOCK		350000
> -
> -/* Two pipes */
> -#define PIPE_A			0
> -#define PIPE_B			1
> -#define PIPE_MASK		1
> -
> -/* palette registers */
> -#define PALETTE_A		0x0a000
> -#define PALETTE_B		0x0a800
> -#ifndef PALETTE_8_ENTRIES
> -#define PALETTE_8_ENTRIES		256
> -#endif
> -#define PALETTE_8_SIZE			(PALETTE_8_ENTRIES * 4)
> -#define PALETTE_10_ENTRIES		128
> -#define PALETTE_10_SIZE			(PALETTE_10_ENTRIES * 8)
> -#define PALETTE_8_MASK			0xff
> -#define PALETTE_8_RED_SHIFT		16
> -#define PALETTE_8_GREEN_SHIFT		8
> -#define PALETTE_8_BLUE_SHIFT		0
> -
> -/* CRTC registers */
> -#define HTOTAL_A		0x60000
> -#define HBLANK_A		0x60004
> -#define HSYNC_A			0x60008
> -#define VTOTAL_A		0x6000c
> -#define VBLANK_A		0x60010
> -#define VSYNC_A			0x60014
> -#define SRC_SIZE_A		0x6001c
> -#define BCLRPAT_A		0x60020
> -
> -#define HTOTAL_B		0x61000
> -#define HBLANK_B		0x61004
> -#define HSYNC_B			0x61008
> -#define VTOTAL_B		0x6100c
> -#define VBLANK_B		0x61010
> -#define VSYNC_B			0x61014
> -#define SRC_SIZE_B		0x6101c
> -#define BCLRPAT_B		0x61020
> -
> -#define HTOTAL_MASK			0xfff
> -#define HTOTAL_SHIFT			16
> -#define HACTIVE_MASK			0x7ff
> -#define HACTIVE_SHIFT			0
> -#define HBLANKEND_MASK			0xfff
> -#define HBLANKEND_SHIFT			16
> -#define HBLANKSTART_MASK		0xfff
> -#define HBLANKSTART_SHIFT		0
> -#define HSYNCEND_MASK			0xfff
> -#define HSYNCEND_SHIFT			16
> -#define HSYNCSTART_MASK			0xfff
> -#define HSYNCSTART_SHIFT		0
> -#define VTOTAL_MASK			0xfff
> -#define VTOTAL_SHIFT			16
> -#define VACTIVE_MASK			0x7ff
> -#define VACTIVE_SHIFT			0
> -#define VBLANKEND_MASK			0xfff
> -#define VBLANKEND_SHIFT			16
> -#define VBLANKSTART_MASK		0xfff
> -#define VBLANKSTART_SHIFT		0
> -#define VSYNCEND_MASK			0xfff
> -#define VSYNCEND_SHIFT			16
> -#define VSYNCSTART_MASK			0xfff
> -#define VSYNCSTART_SHIFT		0
> -#define SRC_SIZE_HORIZ_MASK		0x7ff
> -#define SRC_SIZE_HORIZ_SHIFT		16
> -#define SRC_SIZE_VERT_MASK		0x7ff
> -#define SRC_SIZE_VERT_SHIFT		0
> -
> -#define ADPA			0x61100
> -#define ADPA_DAC_ENABLE			(1 << 31)
> -#define ADPA_DAC_DISABLE		0
> -#define ADPA_PIPE_SELECT_SHIFT		30
> -#define ADPA_USE_VGA_HVPOLARITY		(1 << 15)
> -#define ADPA_SETS_HVPOLARITY		0
> -#define ADPA_DPMS_CONTROL_MASK		(0x3 << 10)
> -#define ADPA_DPMS_D0			(0x0 << 10)
> -#define ADPA_DPMS_D2			(0x1 << 10)
> -#define ADPA_DPMS_D1			(0x2 << 10)
> -#define ADPA_DPMS_D3			(0x3 << 10)
> -#define ADPA_VSYNC_ACTIVE_SHIFT		4
> -#define ADPA_HSYNC_ACTIVE_SHIFT		3
> -#define ADPA_SYNC_ACTIVE_MASK		1
> -#define ADPA_SYNC_ACTIVE_HIGH		1
> -#define ADPA_SYNC_ACTIVE_LOW		0
> -
> -#define DVOA			0x61120
> -#define DVOB			0x61140
> -#define DVOC			0x61160
> -#define LVDS			0x61180
> -#define PORT_ENABLE		        (1 << 31)
> -#define PORT_PIPE_SELECT_SHIFT	        30
> -#define PORT_TV_FLAGS_MASK              0xFF
> -#define PORT_TV_FLAGS                   0xC4	/* ripped from my BIOS
> -						   to understand and correct */
> -
> -#define DVOA_SRCDIM		0x61124
> -#define DVOB_SRCDIM		0x61144
> -#define DVOC_SRCDIM		0x61164
> -
> -#define PIPEA_DSL		0x70000
> -#define PIPEB_DSL		0x71000
> -#define PIPEACONF		0x70008
> -#define PIPEBCONF		0x71008
> -#define PIPEASTAT		0x70024 /* bits 0-15 are "write 1 to clear" */
> -#define PIPEBSTAT		0x71024
> -
> -#define PIPECONF_ENABLE			(1 << 31)
> -#define PIPECONF_DISABLE		0
> -#define PIPECONF_DOUBLE_WIDE		(1 << 30)
> -#define PIPECONF_SINGLE_WIDE		0
> -#define PIPECONF_LOCKED			(1 << 25)
> -#define PIPECONF_UNLOCKED		0
> -#define PIPECONF_GAMMA			(1 << 24)
> -#define PIPECONF_PALETTE		0
> -#define PIPECONF_PROGRESSIVE			(0 << 21)
> -#define PIPECONF_INTERLACE_W_FIELD_INDICATION	(6 << 21)
> -#define PIPECONF_INTERLACE_FIELD_0_ONLY		(7 << 21)
> -#define PIPECONF_INTERLACE_MASK			(7 << 21)
> -
> -/* enable bits, write 1 to enable */
> -#define PIPESTAT_FIFO_UNDERRUN		(1 << 31)
> -#define PIPESTAT_CRC_ERROR_EN		(1 << 29)
> -#define PIPESTAT_CRC_DONE_EN		(1 << 28)
> -#define PIPESTAT_HOTPLUG_EN		(1 << 26)
> -#define PIPESTAT_VERTICAL_SYNC_EN	(1 << 25)
> -#define PIPESTAT_DISPLINE_COMP_EN	(1 << 24)
> -#define PIPESTAT_FLD_EVT_ODD_EN		(1 << 21)
> -#define PIPESTAT_FLD_EVT_EVEN_EN	(1 << 20)
> -#define PIPESTAT_TV_HOTPLUG_EN		(1 << 18)
> -#define PIPESTAT_VBLANK_EN		(1 << 17)
> -#define PIPESTAT_OVL_UPDATE_EN		(1 << 16)
> -/* status bits, write 1 to clear */
> -#define PIPESTAT_HOTPLUG_STATE		(1 << 15)
> -#define PIPESTAT_CRC_ERROR		(1 << 13)
> -#define PIPESTAT_CRC_DONE		(1 << 12)
> -#define PIPESTAT_HOTPLUG		(1 << 10)
> -#define PIPESTAT_VSYNC			(1 << 9)
> -#define PIPESTAT_DISPLINE_COMP		(1 << 8)
> -#define PIPESTAT_FLD_EVT_ODD		(1 << 5)
> -#define PIPESTAT_FLD_EVT_EVEN		(1 << 4)
> -#define PIPESTAT_TV_HOTPLUG		(1 << 2)
> -#define PIPESTAT_VBLANK			(1 << 1)
> -#define PIPESTAT_OVL_UPDATE		(1 << 0)
> -
> -#define DISPARB			0x70030
> -#define DISPARB_AEND_MASK		0x1ff
> -#define DISPARB_AEND_SHIFT		0
> -#define DISPARB_BEND_MASK		0x3ff
> -#define DISPARB_BEND_SHIFT		9
> -
> -/* Desktop HW cursor */
> -#define CURSOR_CONTROL		0x70080
> -#define CURSOR_ENABLE			(1 << 31)
> -#define CURSOR_GAMMA_ENABLE		(1 << 30)
> -#define CURSOR_STRIDE_MASK		(0x3 << 28)
> -#define CURSOR_STRIDE_256		(0x0 << 28)
> -#define CURSOR_STRIDE_512		(0x1 << 28)
> -#define CURSOR_STRIDE_1K		(0x2 << 28)
> -#define CURSOR_STRIDE_2K		(0x3 << 28)
> -#define CURSOR_FORMAT_MASK		(0x7 << 24)
> -#define CURSOR_FORMAT_2C		(0x0 << 24)
> -#define CURSOR_FORMAT_3C		(0x1 << 24)
> -#define CURSOR_FORMAT_4C		(0x2 << 24)
> -#define CURSOR_FORMAT_ARGB		(0x4 << 24)
> -#define CURSOR_FORMAT_XRGB		(0x5 << 24)
> -
> -/* Mobile HW cursor (and i810) */
> -#define CURSOR_A_CONTROL	CURSOR_CONTROL
> -#define CURSOR_B_CONTROL	0x700c0
> -#define CURSOR_MODE_MASK		0x27
> -#define CURSOR_MODE_DISABLE		0
> -#define CURSOR_MODE_64_3C		0x04
> -#define CURSOR_MODE_64_4C_AX		0x05
> -#define CURSOR_MODE_64_4C		0x06
> -#define CURSOR_MODE_64_32B_AX		0x07
> -#define CURSOR_MODE_64_ARGB_AX		0x27
> -#define CURSOR_PIPE_SELECT_SHIFT	28
> -#define CURSOR_MOBILE_GAMMA_ENABLE	(1 << 26)
> -#define CURSOR_MEM_TYPE_LOCAL		(1 << 25)
> -
> -/* All platforms (desktop has no pipe B) */
> -#define CURSOR_A_BASEADDR	0x70084
> -#define CURSOR_B_BASEADDR	0x700c4
> -#define CURSOR_BASE_MASK		0xffffff00
> -
> -#define CURSOR_A_POSITION	0x70088
> -#define CURSOR_B_POSITION	0x700c8
> -#define CURSOR_POS_SIGN			(1 << 15)
> -#define CURSOR_POS_MASK			0x7ff
> -#define CURSOR_X_SHIFT			0
> -#define CURSOR_Y_SHIFT			16
> -
> -#define CURSOR_A_PALETTE0	0x70090
> -#define CURSOR_A_PALETTE1	0x70094
> -#define CURSOR_A_PALETTE2	0x70098
> -#define CURSOR_A_PALETTE3	0x7009c
> -#define CURSOR_B_PALETTE0	0x700d0
> -#define CURSOR_B_PALETTE1	0x700d4
> -#define CURSOR_B_PALETTE2	0x700d8
> -#define CURSOR_B_PALETTE3	0x700dc
> -#define CURSOR_COLOR_MASK			0xff
> -#define CURSOR_RED_SHIFT			16
> -#define CURSOR_GREEN_SHIFT			8
> -#define CURSOR_BLUE_SHIFT			0
> -#define CURSOR_PALETTE_MASK			0xffffff
> -
> -/* Desktop only */
> -#define CURSOR_SIZE		0x700a0
> -#define CURSOR_SIZE_MASK		0x3ff
> -#define CURSOR_SIZE_H_SHIFT		0
> -#define CURSOR_SIZE_V_SHIFT		12
> -
> -#define DSPACNTR		0x70180
> -#define DSPBCNTR		0x71180
> -#define DISPPLANE_PLANE_ENABLE		(1 << 31)
> -#define DISPPLANE_PLANE_DISABLE		0
> -#define DISPPLANE_GAMMA_ENABLE		(1<<30)
> -#define DISPPLANE_GAMMA_DISABLE		0
> -#define DISPPLANE_PIXFORMAT_MASK	(0xf<<26)
> -#define DISPPLANE_8BPP			(0x2<<26)
> -#define DISPPLANE_15_16BPP		(0x4<<26)
> -#define DISPPLANE_16BPP			(0x5<<26)
> -#define DISPPLANE_32BPP_NO_ALPHA	(0x6<<26)
> -#define DISPPLANE_32BPP			(0x7<<26)
> -#define DISPPLANE_STEREO_ENABLE		(1<<25)
> -#define DISPPLANE_STEREO_DISABLE	0
> -#define DISPPLANE_SEL_PIPE_SHIFT	24
> -#define DISPPLANE_SRC_KEY_ENABLE	(1<<22)
> -#define DISPPLANE_SRC_KEY_DISABLE	0
> -#define DISPPLANE_LINE_DOUBLE		(1<<20)
> -#define DISPPLANE_NO_LINE_DOUBLE	0
> -#define DISPPLANE_STEREO_POLARITY_FIRST	0
> -#define DISPPLANE_STEREO_POLARITY_SECOND (1<<18)
> -/* plane B only */
> -#define DISPPLANE_ALPHA_TRANS_ENABLE	(1<<15)
> -#define DISPPLANE_ALPHA_TRANS_DISABLE	0
> -#define DISPPLANE_SPRITE_ABOVE_DISPLAYA	0
> -#define DISPPLANE_SPRITE_ABOVE_OVERLAY	1
> -
> -#define DSPABASE		0x70184
> -#define DSPASTRIDE		0x70188
> -
> -#define DSPBBASE		0x71184
> -#define DSPBSTRIDE		0x71188
> -
> -#define VGACNTRL		0x71400
> -#define VGA_DISABLE			(1 << 31)
> -#define VGA_ENABLE			0
> -#define VGA_PIPE_SELECT_SHIFT		29
> -#define VGA_PALETTE_READ_SELECT		23
> -#define VGA_PALETTE_A_WRITE_DISABLE	(1 << 22)
> -#define VGA_PALETTE_B_WRITE_DISABLE	(1 << 21)
> -#define VGA_LEGACY_PALETTE		(1 << 20)
> -#define VGA_6BIT_DAC			0
> -#define VGA_8BIT_DAC			(1 << 20)
> -
> -#define ADD_ID			0x71408
> -#define ADD_ID_MASK			0xff
> -
> -/* BIOS scratch area registers (830M and 845G). */
> -#define SWF0			0x71410
> -#define SWF1			0x71414
> -#define SWF2			0x71418
> -#define SWF3			0x7141c
> -#define SWF4			0x71420
> -#define SWF5			0x71424
> -#define SWF6			0x71428
> -
> -/* BIOS scratch area registers (852GM, 855GM, 865G). */
> -#define SWF00			0x70410
> -#define SWF01			0x70414
> -#define SWF02			0x70418
> -#define SWF03			0x7041c
> -#define SWF04			0x70420
> -#define SWF05			0x70424
> -#define SWF06			0x70428
> -
> -#define SWF10			SWF0
> -#define SWF11			SWF1
> -#define SWF12			SWF2
> -#define SWF13			SWF3
> -#define SWF14			SWF4
> -#define SWF15			SWF5
> -#define SWF16			SWF6
> -
> -#define SWF30			0x72414
> -#define SWF31			0x72418
> -#define SWF32			0x7241c
> -
> -/* Memory Commands */
> -#define MI_NOOP			(0x00 << 23)
> -#define MI_NOOP_WRITE_ID		(1 << 22)
> -#define MI_NOOP_ID_MASK			((1 << 22) - 1)
> -
> -#define MI_FLUSH		(0x04 << 23)
> -#define MI_WRITE_DIRTY_STATE		(1 << 4)
> -#define MI_END_SCENE			(1 << 3)
> -#define MI_INHIBIT_RENDER_CACHE_FLUSH	(1 << 2)
> -#define MI_INVALIDATE_MAP_CACHE		(1 << 0)
> -
> -#define MI_STORE_DWORD_IMM	((0x20 << 23) | 1)
> -
> -/* 2D Commands */
> -#define COLOR_BLT_CMD		((2 << 29) | (0x40 << 22) | 3)
> -#define XY_COLOR_BLT_CMD	((2 << 29) | (0x50 << 22) | 4)
> -#define XY_SETUP_CLIP_BLT_CMD	((2 << 29) | (0x03 << 22) | 1)
> -#define XY_SRC_COPY_BLT_CMD	((2 << 29) | (0x53 << 22) | 6)
> -#define SRC_COPY_BLT_CMD	((2 << 29) | (0x43 << 22) | 4)
> -#define XY_MONO_PAT_BLT_CMD	((2 << 29) | (0x52 << 22) | 7)
> -#define XY_MONO_SRC_BLT_CMD	((2 << 29) | (0x54 << 22) | 6)
> -#define XY_MONO_SRC_IMM_BLT_CMD	((2 << 29) | (0x71 << 22) | 5)
> -#define TXT_IMM_BLT_CMD	        ((2 << 29) | (0x30 << 22) | 2)
> -#define SETUP_BLT_CMD	        ((2 << 29) | (0x00 << 22) | 6)
> -
> -#define DW_LENGTH_MASK			0xff
> -
> -#define WRITE_ALPHA			(1 << 21)
> -#define WRITE_RGB			(1 << 20)
> -#define VERT_SEED			(3 << 8)
> -#define HORIZ_SEED			(3 << 12)
> -
> -#define COLOR_DEPTH_8			(0 << 24)
> -#define COLOR_DEPTH_16			(1 << 24)
> -#define COLOR_DEPTH_32			(3 << 24)
> -
> -#define SRC_ROP_GXCOPY			0xcc
> -#define SRC_ROP_GXXOR			0x66
> -
> -#define PAT_ROP_GXCOPY                  0xf0
> -#define PAT_ROP_GXXOR                   0x5a
> -
> -#define PITCH_SHIFT			0
> -#define ROP_SHIFT			16
> -#define WIDTH_SHIFT			0
> -#define HEIGHT_SHIFT			16
> -
> -/* in bytes */
> -#define MAX_MONO_IMM_SIZE		128
> -
> -
> -/*** Macros ***/
> -
> -/* I/O macros */
> -#define INREG8(addr)	      readb((u8 __iomem *)(dinfo->mmio_base + (addr=
)))
> -#define INREG16(addr)	      readw((u16 __iomem *)(dinfo->mmio_base + (ad=
dr)))
> -#define INREG(addr)	      readl((u32 __iomem *)(dinfo->mmio_base + (addr=
)))
> -#define OUTREG8(addr, val)    writeb((val),(u8 __iomem *)(dinfo->mmio_ba=
se + \
> -							   (addr)))
> -#define OUTREG16(addr, val)    writew((val),(u16 __iomem *)(dinfo->mmio_=
base + \
> -							   (addr)))
> -#define OUTREG(addr, val)     writel((val),(u32 __iomem *)(dinfo->mmio_b=
ase + \
> -                                     (addr)))
> -
> -/* Ring buffer macros */
> -#define OUT_RING(n)	do {						\
> -	writel((n), (u32 __iomem *)(dinfo->ring.virtual + dinfo->ring_tail));\
> -	dinfo->ring_tail +=3D 4;						\
> -	dinfo->ring_tail &=3D dinfo->ring_tail_mask;			\
> -} while (0)
> -
> -#define START_RING(n)	do {						\
> -	if (dinfo->ring_space < (n) * 4)				\
> -		wait_ring(dinfo,(n) * 4);				\
> -	dinfo->ring_space -=3D (n) * 4;					\
> -} while (0)
> -
> -#define ADVANCE_RING()	do {						\
> -	OUTREG(PRI_RING_TAIL, dinfo->ring_tail);                        \
> -} while (0)
> -
> -#define DO_RING_IDLE()	do {						\
> -	u32 head, tail;							\
> -	do {								\
> -		head =3D INREG(PRI_RING_HEAD) & RING_HEAD_MASK;		\
> -		tail =3D INREG(PRI_RING_TAIL) & RING_TAIL_MASK;		\
> -		udelay(10);						\
> -	} while (head !=3D tail);						\
> -} while (0)
> -
> -
> -/* function protoypes */
> -extern int intelfbhw_get_chipset(struct pci_dev *pdev, struct intelfb_in=
fo *dinfo);
> -extern int intelfbhw_get_memory(struct pci_dev *pdev, int *aperture_size,
> -				int *stolen_size);
> -extern int intelfbhw_check_non_crt(struct intelfb_info *dinfo);
> -extern const char *intelfbhw_dvo_to_string(int dvo);
> -extern int intelfbhw_validate_mode(struct intelfb_info *dinfo,
> -				   struct fb_var_screeninfo *var);
> -extern int intelfbhw_pan_display(struct fb_var_screeninfo *var,
> -				 struct fb_info *info);
> -extern void intelfbhw_do_blank(int blank, struct fb_info *info);
> -extern void intelfbhw_setcolreg(struct intelfb_info *dinfo, unsigned reg=
no,
> -				unsigned red, unsigned green, unsigned blue,
> -				unsigned transp);
> -extern int intelfbhw_read_hw_state(struct intelfb_info *dinfo,
> -				   struct intelfb_hwstate *hw, int flag);
> -extern void intelfbhw_print_hw_state(struct intelfb_info *dinfo,
> -				     struct intelfb_hwstate *hw);
> -extern int intelfbhw_mode_to_hw(struct intelfb_info *dinfo,
> -				struct intelfb_hwstate *hw,
> -				struct fb_var_screeninfo *var);
> -extern int intelfbhw_program_mode(struct intelfb_info *dinfo,
> -				  const struct intelfb_hwstate *hw, int blank);
> -extern void intelfbhw_do_sync(struct intelfb_info *dinfo);
> -extern void intelfbhw_2d_stop(struct intelfb_info *dinfo);
> -extern void intelfbhw_2d_start(struct intelfb_info *dinfo);
> -extern void intelfbhw_do_fillrect(struct intelfb_info *dinfo, u32 x, u32=
 y,
> -				  u32 w, u32 h, u32 color, u32 pitch, u32 bpp,
> -				  u32 rop);
> -extern void intelfbhw_do_bitblt(struct intelfb_info *dinfo, u32 curx, u3=
2 cury,
> -				u32 dstx, u32 dsty, u32 w, u32 h, u32 pitch,
> -				u32 bpp);
> -extern int intelfbhw_do_drawglyph(struct intelfb_info *dinfo, u32 fg, u3=
2 bg,
> -				  u32 w, u32 h, const u8* cdat, u32 x, u32 y,
> -				  u32 pitch, u32 bpp);
> -extern void intelfbhw_cursor_init(struct intelfb_info *dinfo);
> -extern void intelfbhw_cursor_hide(struct intelfb_info *dinfo);
> -extern void intelfbhw_cursor_show(struct intelfb_info *dinfo);
> -extern void intelfbhw_cursor_setpos(struct intelfb_info *dinfo, int x, i=
nt y);
> -extern void intelfbhw_cursor_setcolor(struct intelfb_info *dinfo, u32 bg,
> -				      u32 fg);
> -extern void intelfbhw_cursor_load(struct intelfb_info *dinfo, int width,
> -				  int height, u8 *data);
> -extern void intelfbhw_cursor_reset(struct intelfb_info *dinfo);
> -extern int intelfbhw_enable_irq(struct intelfb_info *dinfo);
> -extern void intelfbhw_disable_irq(struct intelfb_info *dinfo);
> -extern int intelfbhw_wait_for_vsync(struct intelfb_info *dinfo, u32 pipe=
);
> -extern int intelfbhw_active_pipe(const struct intelfb_hwstate *hw);
> -
> -#endif /* _INTELFBHW_H */
> --=20
> 2.43.0
>=20

--Maik

