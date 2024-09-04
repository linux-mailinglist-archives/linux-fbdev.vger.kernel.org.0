Return-Path: <linux-fbdev+bounces-2971-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FDB96B488
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Sep 2024 10:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B629FB21872
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Sep 2024 08:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07913185956;
	Wed,  4 Sep 2024 08:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="L5mMESxP";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="PLZByGru"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AA21547E9
	for <linux-fbdev@vger.kernel.org>; Wed,  4 Sep 2024 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725438595; cv=none; b=EC72yo4rXpQsRlKZxgHE3H6N0AjFzt6eT9RZiMtmHdW97d1xXw/qnl3L7weQviQx3pWa5fTpP5dYZznx18cTlOzz+PjG6FuYrG38Nnwc5GUBrivJTQym0R/vvEdkNqmNmGMjYQhBi6QLYYvgxKa1LPMqAlr1AbhT2PJULiZAShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725438595; c=relaxed/simple;
	bh=Caexty1vMFq/xyfrVFT1tRhqaPlwGCFtYml59CQaN9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Twpva6JPU+dNiZlcoWb3QagJuMAaeOn6EAY8LaaUopOd/3XFM4StZ5Sg9L9QiKkxQkRDnJgSSv/ExeEl7cz9XZA6w24RaYVES1IZefpp3IoE47Et6BtyPCz8K85XnH9Pr9SA8ec1BzS1ffkIFySnPCj+Al3zvWptW02vNidOAbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=L5mMESxP; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=PLZByGru reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1725438592; x=1756974592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qr5M44lPqooJeBjxin8WHsmbuDIe92aC2YJzqZ6za/c=;
  b=L5mMESxPGf3z05Pi4/gRJIwfVgsHU72yu+bkZ8Izp0dbiVuLazcKSxw8
   GT3/JJKqR8Be+4+PPOdeVypkhgd6Kt86c0+ztMrxqc1ztG2+aJesap6+B
   oDriT2au+NCAHEuQD8W3941jEXZOa3VfgvguDCv0zk0fmlZDUk4K31H2T
   ZaKp6sgPxELow9YmXoGGgs+aT/pN0vqBtZ5j9uRCE+dIpTGazQOAa+YDS
   ++t+DE0oA8J7wrXnJEYCE0Qhyah+csAbQ5UX0+momQRFsYkIecFIZIgXH
   wFIF3TZMwrfS2B/qP/OBaqwPDEXEdB+ngq1++rC3g8jtgxBIh9R83ZiBg
   g==;
X-CSE-ConnectionGUID: OIlkvrrGSpqpBSi7JS8oAg==
X-CSE-MsgGUID: J7pRoD1OSQCTbZ6bUEcByA==
X-IronPort-AV: E=Sophos;i="6.10,201,1719871200"; 
   d="scan'208";a="38755639"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Sep 2024 10:29:49 +0200
X-CheckPoint: {66D81A7D-5-C661815F-E221238E}
X-MAIL-CPID: A3394C295629C962D413CA05F12BF974_1
X-Control-Analysis: str=0001.0A782F22.66D81A7D.0116,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FC85168CAC;
	Wed,  4 Sep 2024 10:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1725438584;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qr5M44lPqooJeBjxin8WHsmbuDIe92aC2YJzqZ6za/c=;
	b=PLZByGruFuWQk9AHke+G++t4jPm4iXEISDxcOBaSDf8jU/Yp/iXgeUwltpmsOhVWHNHG1y
	84c8HUojTbU9MdGnT7wraAoYSaAn3rvVz5nR6E3rS8KsG0QupffCJIKpwZCujPTcNf3TUj
	ebzUBEIJqnMCGaxapo/NSslM0NHbDI2RQ+CivVoQ/rJUKr2rN7SHqMAymNLvPDvgmXXJZh
	eiRt2mD7IXxkeMyrz/rjR0HGgGuR4Sq2y8ucyG1lEx7o5KoyArR5xz8NJYxTf8sQJ5/Vn0
	PUR/aguibohaQ2p+r8nOKhA4Mt3qT6mcjskKwUWjxGsOZmtRWNWYBPZZg0vG7Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org
Cc: javierm@redhat.com, deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 21/43] drm/fbdev-dma: Implement damage handling and deferred I/O
Date: Wed, 04 Sep 2024 10:29:43 +0200
Message-ID: <3312559.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2846e207-43d5-4164-8a2e-5ce9d2aaab38@suse.de>
References: <20240419083331.7761-1-tzimmermann@suse.de> <CACRpkdb+hb9AGavbWpY-=uQQ0apY9en_tWJioPKf_fAbXMP4Hg@mail.gmail.com> <2846e207-43d5-4164-8a2e-5ce9d2aaab38@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi Thomas,

Am Mittwoch, 4. September 2024, 09:41:12 CEST schrieb Thomas Zimmermann:
> Hi Linus, Alexander,
>=20
> Attached is a patch to mitigate the problem and go back to the old=20
> behavior for pl111. Can you please test it on affected and unaffected=20
> systems and report the results?

Thank you for the patch. This indeed fixes the mmap problem on my i.MX6
platform which only has Normal memory:

[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000010000000-0x000000002fffffff]
[    0.000000]   HighMem  empty

But please note this is not pl111 based but IPUv3 (drivers/gpu/ipu-v3).
You might want to adjust the commit message.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander

> Am 04.09.24 um 00:53 schrieb Linus Walleij:
> > On Fri, Apr 19, 2024 at 10:35=E2=80=AFAM Thomas Zimmermann <tzimmermann=
@suse.de> wrote:
> >
> >> Add support for damage handling and deferred I/O to fbdev-dma. This
> >> enables fbdev-dma to support all DMA-memory-based DRM drivers, even
> >> such with a dirty callback in their framebuffers.
> >>
> >> The patch adds the code for deferred I/O and also sets a dedicated
> >> helper for struct fb_ops.fb_mmap that support coherent mappings.
> >>
> >> v3:
> >> - init fb_ops with FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS() (Javier)
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > For some reason this makes the Versatile Express crash in QEMU
> > (I can retest on real hardware if necessary):
> >
> > 8<--- cut here ---
> > Unable to handle kernel paging request at virtual address 18095000 when=
 write
> > [18095000] *pgd=3D00000000
> > Internal error: Oops: 805 [#1] SMP ARM
> > CPU: 0 PID: 75 Comm: S08_ledflash Not tainted 6.9.0-rc6+ #44
> > Hardware name: ARM-Versatile Express
> > PC is at mmioset+0x34/0xac
> > LR is at 0x0
> > pc : [<809c2a54>]    lr : [<00000000>]    psr: 20000013
> > sp : f8dddc38  ip : 18095000  fp : 00000000
> > r10: 81109a18  r9 : 81238b04  r8 : 00000000
> > r7 : 00440dc0  r6 : ed4f32a0  r5 : ed4f32a0  r4 : 00000001
> > r3 : 00000000  r2 : 00000fc0  r1 : 00000000  r0 : 18095000
> > Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> > Control: 10c5387d  Table: 81d6406a  DAC: 00000051
> > Register r0 information: non-paged memory
> > Register r1 information: NULL pointer
> > Register r2 information: non-paged memory
> > Register r3 information: NULL pointer
> > Register r4 information: non-paged memory
> > Register r5 information: non-slab/vmalloc memory
> > Register r6 information: non-slab/vmalloc memory
> > Register r7 information: non-paged memory
> > Register r8 information: NULL pointer
> > Register r9 information: non-slab/vmalloc memory
> > Register r10 information: non-slab/vmalloc memory
> > Register r11 information: NULL pointer
> > Register r12 information: non-paged memory
> > Process S08_ledflash (pid: 75, stack limit =3D 0x(ptrval))
> > Stack: (0xf8dddc38 to 0xf8dde000)
> > dc20:                                                       00000801 80=
2af888
> > dc40: 80a0fb80 00440dc0 00000801 811fad80 00000000 f8dddd28 ed4f32a0 81=
1fa680
> > dc60: 00000000 802b0c30 ee1d2140 ee1d215c 95ff4385 00000001 00000001 00=
000001
> > dc80: 00000000 00000000 ffffffff 8196a70b 000000b0 00000064 0000006c 00=
000000
> > dca0: 00000001 00000002 00000001 811fa798 00000801 811fa940 80a0fb80 00=
000cc0
> > dcc0: 00000001 00000001 00000000 f8dddd28 811fa93c 811fa680 00000002 80=
2b0c30
> > dce0: ee1d2140 00440dc0 00000000 00000000 00000001 00000000 811fad80 00=
440dc0
> > dd00: 00000001 00000000 00000000 83201100 00440dc0 00000000 00000000 80=
2afa18
> > dd20: 00000bdc 00000bd8 811fad80 00000000 811fad80 00000000 00000000 00=
000000
> > dd40: adf00ec5 816d5fa8 816d5fa8 821c3c00 00000000 7ebc2000 7ebe3000 00=
000000
> > dd60: f8ddde44 8028cfa0 816d5fa8 8288df50 8169cf00 821c3c00 7ebc2000 7e=
be3000
> > dd80: f8ddde44 8028e1e8 00000001 80bbe932 f8ddde44 f8dddde8 f8ddde44 82=
88df50
> > dda0: 83201100 809cf474 f8ddde44 8169cf00 00000020 8169cf94 821c3c94 7e=
be3000
> > ddc0: 7ebe2fff fffffff4 00000000 816d5fa8 821c3c00 8169cf00 81d65fa8 80=
9cdbb0
> > dde0: 8288df50 81ffa910 7ebe3000 82890b00 00000000 00000000 00000000 00=
000000
> > de00: 00000000 00000000 adf00ec5 00000000 00000000 8169cf00 8288df50 83=
201100
> > de20: 821c3c00 81ffa910 f8ddde44 8011f6e4 00000000 00000000 821c3c7c 81=
69cf7c
> > de40: 83200880 821c3c40 7ebc2000 7ebe2fff 82890b0c 76ea4000 ffffffff 00=
000000
> > de60: 00000000 0f000a01 f8ddde68 f8ddde68 adf00ec5 00000000 00000000 00=
000000
> > de80: 00000000 01200000 83201100 00000000 00000000 8011e2ac 00000000 83=
200d7c
> > dea0: 83201020 83200e70 83200e80 00000000 f8dddf30 83200880 00000000 00=
000000
> > dec0: 00000000 00000000 00000000 82182f38 adf00ec5 00000000 01200000 f8=
dddf30
> > dee0: 00000000 00000000 00000000 00000078 000cb21c 8011fe24 00000020 00=
000000
> > df00: 828a5d80 80a10140 adf00ec5 01200011 00000000 00000000 00000000 f8=
dddf30
> > df20: 00000000 00000078 000cb21c 801203d4 01200000 00000000 00000000 76=
f46468
> > df40: 00000000 00000000 00000011 00000000 00000000 00000000 00000000 00=
000000
> > df60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
> > df80: 00000003 adf00ec5 76f46468 00000000 76f468c0 00000078 80100290 83=
201100
> > dfa0: 000cb21c 80100060 76f46468 00000000 01200011 00000000 00000000 00=
000000
> > dfc0: 76f46468 00000000 76f468c0 00000078 00000000 76e81000 76f46400 00=
0cb21c
> > dfe0: 00000078 7ebe2938 76e0854d 76dae7e6 20000030 01200011 00000000 00=
000000
> > Call trace:
> >   mmioset from prep_new_page+0x160/0x194
> >   prep_new_page from get_page_from_freelist+0x10f4/0x110c
> >   get_page_from_freelist from __alloc_pages+0x15c/0x280
> >   __alloc_pages from __pte_alloc+0x28/0x1bc
> >   __pte_alloc from copy_page_range+0xc10/0xd28
> >   copy_page_range from copy_mm+0x5cc/0x850
> >   copy_mm from copy_process+0x508/0xd8c
> >   copy_process from kernel_clone+0x94/0x338
> >   kernel_clone from sys_clone+0x94/0xb0
> >   sys_clone from ret_fast_syscall+0x0/0x1c
> > Exception stack(0xf8dddfa8 to 0xf8dddff0)
> > dfa0:                   76f46468 00000000 01200011 00000000 00000000 00=
000000
> > dfc0: 76f46468 00000000 76f468c0 00000078 00000000 76e81000 76f46400 00=
0cb21c
> > dfe0: 00000078 7ebe2938 76e0854d 76dae7e6
> > Code: e92d4100 e1a08001 e1a0e003 e2522040 (a8ac410a)
> > ---[ end trace 0000000000000000 ]---
> >
> > I bisected down to this commit and reverting the commit solves the issu=
e.
> >
> > What is special about the Versatile Express graphics is that it uses a =
special
> > dedicated video RAM, looks like this in the device tree
> >
> >
> >          reserved-memory {
> >                  #address-cells =3D <1>;
> >                  #size-cells =3D <1>;
> >                  ranges;
> >
> >                  /* Chipselect 3 is physically at 0x4c000000 */
> >                  vram: vram@4c000000 {
> >                          /* 8 MB of designated video RAM */
> >                          compatible =3D "shared-dma-pool";
> >                          reg =3D <0x4c000000 0x00800000>;
> >                          no-map;
> >                  };
> >          };
> > (...)
> >           clcd@1f000 {
> >                        compatible =3D "arm,pl111", "arm,primecell";
> > (...)
> >                        memory-region =3D <&vram>;
> >
> > This gets picked up in the driver
> > drivers/gpu/drm/pl111/pl111_drv.c
> > like this:
> >
> >          ret =3D of_reserved_mem_device_init(dev);
> >          if (!ret) {
> >                  dev_info(dev, "using device-specific reserved memory\n=
");
> >                  priv->use_device_memory =3D true;
> >          }
> >
> > Yours,
> > Linus Walleij
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



