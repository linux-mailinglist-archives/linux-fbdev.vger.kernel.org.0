Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD6168B789
	for <lists+linux-fbdev@lfdr.de>; Mon,  6 Feb 2023 09:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbjBFIl4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 6 Feb 2023 03:41:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjBFIln (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 6 Feb 2023 03:41:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A8B17141
        for <linux-fbdev@vger.kernel.org>; Mon,  6 Feb 2023 00:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675672858;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=roTV3VmW5X0JgyWd8+N9XcQz3DnWn4LG2jD8zZdvfpc=;
        b=Ri2PbiXfoJKv7DhRYBoE8Ca1pX5MPIs6Hf8CcX5JMzCmirf7Do+nczv42dbwEP8EL3fu7Y
        Vbn7nv/04wrdnM26D91AE/81M6KJMM4qKK/9xo0uernd1u00p3AdKXxT71lq9D/EXVXceq
        522h8b/bcFpCMnbpMka/5lQLcIgG880=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-NcJnW9O5MJiwMnWgNFf7BQ-1; Mon, 06 Feb 2023 03:40:54 -0500
X-MC-Unique: NcJnW9O5MJiwMnWgNFf7BQ-1
Received: by mail-qv1-f71.google.com with SMTP id n13-20020a056214008d00b0053a62a11f9fso5475164qvr.2
        for <linux-fbdev@vger.kernel.org>; Mon, 06 Feb 2023 00:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roTV3VmW5X0JgyWd8+N9XcQz3DnWn4LG2jD8zZdvfpc=;
        b=bfaPutZ090KDOtvG+AwrRt8SjUlTCaOMSF4p7kkfT4o2kQXqFOK7Ho6cvBoiqROVoy
         IJ5gZ+ltwfeC75foJqpT4pyLJaEWR/t2vkKgHMkoETdLWVVtapB9c+mePFEkXkhE2kTb
         t8Pyw+BfQqytg85FUASUQHxo/RacLBgCC9IF1Ei3BfTihoKpv85jfzQ0XZFgEUIv6Tdj
         RAqaCdjSv2FM54oLA4/scJ/MzFv5mSROEbjAX3x+w8mGYboPeeetxAMn5EUlQ41yRIbD
         Qegv67/4LDtEOVuxnry121TgVTtfwanZsxNVc+dU6svp5ebuatfFFTG1KkYB/NlmQmiv
         UWpw==
X-Gm-Message-State: AO0yUKUsNYDJMsBJG8+3FVUQuzFxyz9ZEEITSI1UvJzb3+slSOUqfOzK
        1TYqBufSq4fhMq6x1BcdRnWgTsIL2S5beexuHCZICqIO5oK/u8G4fZJsWfsXDyALdVQKhchzy4U
        tK9C8g1HzQNDSCwswG8MSqfbQRzKIcjdFCkdaBDY=
X-Received: by 2002:a05:620a:a95:b0:725:1245:9cea with SMTP id v21-20020a05620a0a9500b0072512459ceamr1144348qkg.233.1675672853997;
        Mon, 06 Feb 2023 00:40:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/AyyLKWKC0Tzhd4X1sVhMpuQEy8NmHdpvAo+907dt4f/zUYiFlzaghQWvc33xB0w4f6AglGqNdHIJCw287vv0=
X-Received: by 2002:a05:620a:a95:b0:725:1245:9cea with SMTP id
 v21-20020a05620a0a9500b0072512459ceamr1144344qkg.233.1675672853645; Mon, 06
 Feb 2023 00:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20230205210751.3842103-1-airlied@gmail.com> <CAOkhzLWSJsDK9Gm-AzeUw7fCpkjDg7d9GuDWyF-6hDr5UZ4DZg@mail.gmail.com>
 <CAPM=9tyaCUmA2bNP1YA1B=cFZP=nKPhQoWR7UwBD2Nfj8ZTODA@mail.gmail.com>
 <CAOkhzLVLbOEp4QnJynxV3cgiqOV5Rm=+dMgexiRmyDs-bRCTPg@mail.gmail.com>
 <CAPM=9tx0D54oQ6QmjF_NxnBBxbLzhXxi5uH2p6fLWfg2L3xPFw@mail.gmail.com> <CAOkhzLUspmZjC0x6nJoHyc9nijqZu7BOWc8vsqHSRbQhVzd=Gw@mail.gmail.com>
In-Reply-To: <CAOkhzLUspmZjC0x6nJoHyc9nijqZu7BOWc8vsqHSRbQhVzd=Gw@mail.gmail.com>
From:   David Airlie <airlied@redhat.com>
Date:   Mon, 6 Feb 2023 18:40:42 +1000
Message-ID: <CAMwc25q9LO0N45DAV6HeONVsWBbOxxYCkSV12Yhr3PVorrr4dg@mail.gmail.com>
Subject: Re: [PATCH] nvidiafb: detect the hardware support before removing console.
To:     Zeno Davatz <zdavatz@gmail.com>
Cc:     Dave Airlie <airlied@gmail.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bjorn@helgaas.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000003403e205f403fd13"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

--0000000000003403e205f403fd13
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 6, 2023 at 6:38 PM Zeno Davatz <zdavatz@gmail.com> wrote:
>
> Dear Dave
>
> On Mon, Feb 6, 2023 at 9:10 AM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Mon, 6 Feb 2023 at 18:01, Zeno Davatz <zdavatz@gmail.com> wrote:
> > >
> > > Dear Dave
> > >
> > > On Mon, Feb 6, 2023 at 8:54 AM Dave Airlie <airlied@gmail.com> wrote:
> > > >
> > > > On Mon, 6 Feb 2023 at 17:52, Zeno Davatz <zdavatz@gmail.com> wrote:
> > > > >
> > > > > Dear Dave
> > > > >
> > > > > Thank you for your patch.
> > > > >
> > > > > On Sun, Feb 5, 2023 at 10:07 PM Dave Airlie <airlied@gmail.com> wrote:
> > > > > >
> > > > > > From: Dave Airlie <airlied@redhat.com>
> > > > > >
> > > > > > This driver removed the console, but hasn't yet decided if it could
> > > > > > take over the console yet. Instead of doing that, probe the hw for
> > > > > > support and then remove the console afterwards.
> > > > > >
> > > > > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > > > > > Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=216859
> > > > > > Reported-by: Zeno Davatz <zdavatz@gmail.com>
> > > > > > ---
> > > > > >  drivers/video/fbdev/nvidia/nvidia.c | 81 +++++++++++++++--------------
> > > > > >  1 file changed, 42 insertions(+), 39 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
> > > > > > index 1960916098d4..e60a276b4855 100644
> > > > > > --- a/drivers/video/fbdev/nvidia/nvidia.c
> > > > > > +++ b/drivers/video/fbdev/nvidia/nvidia.c
> > > > > > @@ -1197,17 +1197,17 @@ static int nvidia_set_fbinfo(struct fb_info *info)
> > > > > >         return nvidiafb_check_var(&info->var, info);
> > > > > >  }
> > > > > >
> > > > > > -static u32 nvidia_get_chipset(struct fb_info *info)
> > > > > > +static u32 nvidia_get_chipset(struct pci_dev *pci_dev,
> > > > > > +                             volatile u32 __iomem *REGS)
> > > > > >  {
> > > > > > -       struct nvidia_par *par = info->par;
> > > > > > -       u32 id = (par->pci_dev->vendor << 16) | par->pci_dev->device;
> > > > > > +       u32 id = (pci_dev->vendor << 16) | pci_dev->device;
> > > > > >
> > > > > >         printk(KERN_INFO PFX "Device ID: %x \n", id);
> > > > > >
> > > > > >         if ((id & 0xfff0) == 0x00f0 ||
> > > > > >             (id & 0xfff0) == 0x02e0) {
> > > > > >                 /* pci-e */
> > > > > > -               id = NV_RD32(par->REGS, 0x1800);
> > > > > > +               id = NV_RD32(REGS, 0x1800);
> > > > > >
> > > > > >                 if ((id & 0x0000ffff) == 0x000010DE)
> > > > > >                         id = 0x10DE0000 | (id >> 16);
> > > > > > @@ -1220,12 +1220,11 @@ static u32 nvidia_get_chipset(struct fb_info *info)
> > > > > >         return id;
> > > > > >  }
> > > > > >
> > > > > > -static u32 nvidia_get_arch(struct fb_info *info)
> > > > > > +static u32 nvidia_get_arch(u32 Chipset)
> > > > > >  {
> > > > > > -       struct nvidia_par *par = info->par;
> > > > > >         u32 arch = 0;
> > > > > >
> > > > > > -       switch (par->Chipset & 0x0ff0) {
> > > > > > +       switch (Chipset & 0x0ff0) {
> > > > > >         case 0x0100:            /* GeForce 256 */
> > > > > >         case 0x0110:            /* GeForce2 MX */
> > > > > >         case 0x0150:            /* GeForce2 */
> > > > > > @@ -1278,16 +1277,44 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > > > > >         struct fb_info *info;
> > > > > >         unsigned short cmd;
> > > > > >         int ret;
> > > > > > +       volatile u32 __iomem *REGS;
> > > > > > +       int Chipset;
> > > > > > +       u32 Architecture;
> > > > > >
> > > > > >         NVTRACE_ENTER();
> > > > > >         assert(pd != NULL);
> > > > > >
> > > > > > +       if (pci_enable_device(pd)) {
> > > > > > +               printk(KERN_ERR PFX "cannot enable PCI device\n");
> > > > > > +               return -ENODEV;
> > > > > > +       }
> > > > > > +
> > > > > > +       /* enable IO and mem if not already done */
> > > > > > +       pci_read_config_word(pd, PCI_COMMAND, &cmd);
> > > > > > +       cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
> > > > > > +       pci_write_config_word(pd, PCI_COMMAND, cmd);
> > > > > > +
> > > > > > +       nvidiafb_fix.mmio_start = pci_resource_start(pd, 0);
> > > > > > +       nvidiafb_fix.mmio_len = pci_resource_len(pd, 0);
> > > > > > +
> > > > > > +       REGS = ioremap(nvidiafb_fix.mmio_start, nvidiafb_fix.mmio_len);
> > > > > > +       if (!REGS) {
> > > > > > +               printk(KERN_ERR PFX "cannot ioremap MMIO base\n");
> > > > > > +               return -ENODEV;
> > > > > > +       }
> > > > > > +
> > > > > > +       Chipset = nvidia_get_chipset(pd, REGS);
> > > > > > +       Architecture = nvidia_get_arch(Chipset);
> > > > > > +       if (Architecture == 0) {
> > > > > > +               printk(KERN_ERR PFX "unknown NV_ARCH\n");
> > > > > > +               goto err_out;
> > > > > > +       }
> > > > > > +
> > > > > >         ret = aperture_remove_conflicting_pci_devices(pd, "nvidiafb");
> > > > > >         if (ret)
> > > > > > -               return ret;
> > > > > > +               goto err_out;
> > > > > >
> > > > > >         info = framebuffer_alloc(sizeof(struct nvidia_par), &pd->dev);
> > > > > > -
> > > > > >         if (!info)
> > > > > >                 goto err_out;
> > > > > >
> > > > > > @@ -1298,11 +1325,6 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > > > > >         if (info->pixmap.addr == NULL)
> > > > > >                 goto err_out_kfree;
> > > > > >
> > > > > > -       if (pci_enable_device(pd)) {
> > > > > > -               printk(KERN_ERR PFX "cannot enable PCI device\n");
> > > > > > -               goto err_out_enable;
> > > > > > -       }
> > > > > > -
> > > > > >         if (pci_request_regions(pd, "nvidiafb")) {
> > > > > >                 printk(KERN_ERR PFX "cannot request PCI regions\n");
> > > > > >                 goto err_out_enable;
> > > > > > @@ -1318,34 +1340,17 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > > > > >         par->paneltweak = paneltweak;
> > > > > >         par->reverse_i2c = reverse_i2c;
> > > > > >
> > > > > > -       /* enable IO and mem if not already done */
> > > > > > -       pci_read_config_word(pd, PCI_COMMAND, &cmd);
> > > > > > -       cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
> > > > > > -       pci_write_config_word(pd, PCI_COMMAND, cmd);
> > > > > > -
> > > > > > -       nvidiafb_fix.mmio_start = pci_resource_start(pd, 0);
> > > > > >         nvidiafb_fix.smem_start = pci_resource_start(pd, 1);
> > > > > > -       nvidiafb_fix.mmio_len = pci_resource_len(pd, 0);
> > > > > > -
> > > > > > -       par->REGS = ioremap(nvidiafb_fix.mmio_start, nvidiafb_fix.mmio_len);
> > > > > >
> > > > > > -       if (!par->REGS) {
> > > > > > -               printk(KERN_ERR PFX "cannot ioremap MMIO base\n");
> > > > > > -               goto err_out_free_base0;
> > > > > > -       }
> > > > > > +       par->REGS = REGS;
> > > > > >
> > > > > > -       par->Chipset = nvidia_get_chipset(info);
> > > > > > -       par->Architecture = nvidia_get_arch(info);
> > > > > > -
> > > > > > -       if (par->Architecture == 0) {
> > > > > > -               printk(KERN_ERR PFX "unknown NV_ARCH\n");
> > > > > > -               goto err_out_arch;
> > > > > > -       }
> > > > > > +       par->Chipset = Chipset;
> > > > > > +       par->Architecture = Architecture;
> > > > > >
> > > > > >         sprintf(nvidiafb_fix.id, "NV%x", (pd->device & 0x0ff0) >> 4);
> > > > > >
> > > > > >         if (NVCommonSetup(info))
> > > > > > -               goto err_out_arch;
> > > > > > +               goto err_out_free_base0;
> > > > > >
> > > > > >         par->FbAddress = nvidiafb_fix.smem_start;
> > > > > >         par->FbMapSize = par->RamAmountKBytes * 1024;
> > > > > > @@ -1401,7 +1406,6 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > > > > >                 goto err_out_iounmap_fb;
> > > > > >         }
> > > > > >
> > > > > > -
> > > > > >         printk(KERN_INFO PFX
> > > > > >                "PCI nVidia %s framebuffer (%dMB @ 0x%lX)\n",
> > > > > >                info->fix.id,
> > > > > > @@ -1415,15 +1419,14 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > > > > >  err_out_free_base1:
> > > > > >         fb_destroy_modedb(info->monspecs.modedb);
> > > > > >         nvidia_delete_i2c_busses(par);
> > > > > > -err_out_arch:
> > > > > > -       iounmap(par->REGS);
> > > > > > - err_out_free_base0:
> > > > > > +err_out_free_base0:
> > > > > >         pci_release_regions(pd);
> > > > > >  err_out_enable:
> > > > > >         kfree(info->pixmap.addr);
> > > > > >  err_out_kfree:
> > > > > >         framebuffer_release(info);
> > > > > >  err_out:
> > > > > > +       iounmap(REGS);
> > > > > >         return -ENODEV;
> > > > > >  }
> > > > > >
> > > > > > --
> > > > > > 2.38.1
> > > > >
> > > > > This patch fails for me.
> > > >
> > > > I've based the patch on 6.2-rc7, please make sure to not have the
> > > > previous revert committed, this is to replace that patch.
> > >
> > > Can you guide me through the steps please?
> > >
> > > I done:
> > >
> > > 1. cd /usr/src/linux
> > > 2. sudo git pull
> > > 3. then I applied your patch.
> > >
> > > Am I doing something wrong?
> >
> > What is your top of tree commit? (git log)
> >
> > have you got any commits on top?
> >
> > git reset --hard origin/master should reset your tree to Linus top.
>
> 1. git log shows "d2d11f342b179f1894a901f143ec7c008caba43e"
> 2. No, no patches on top.
> 3. I am doing the following steps:
> /usr/src/linux> sudo git reset --hard origin/master
> Passwort:
> HEAD ist jetzt bei d2d11f342b17 Merge branch 'fixes' of
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
> /usr/src/linux> sudo patch -p1 < /tmp/patch
> patching file drivers/video/fbdev/nvidia/nvidia.c
> Hunk #1 FAILED at 1197.
> Hunk #2 FAILED at 1220.
> Hunk #3 FAILED at 1278.
> Hunk #4 FAILED at 1298.
> Hunk #5 FAILED at 1318.
> Hunk #6 FAILED at 1401.
> Hunk #7 FAILED at 1415.
> 7 out of 7 hunks FAILED -- saving rejects to file
> drivers/video/fbdev/nvidia/nvidia.c.rej
>
Are you pulling the patch from email? I guess your email service or
something is mangling it.

I've attached it to see if that helps.

Dave.

--0000000000003403e205f403fd13
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-nvidiafb-detect-the-hardware-support-before-removing.patch"
Content-Disposition: attachment; 
	filename="0001-nvidiafb-detect-the-hardware-support-before-removing.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ldskc7v50>
X-Attachment-Id: f_ldskc7v50

RnJvbSA1OGQ4YzRlNTkxNzljNzZmZTdmYjEwY2FjZmFjZGM5NWVkYzQzYzYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpEYXRl
OiBNb24sIDYgRmViIDIwMjMgMDc6MDU6MjggKzEwMDAKU3ViamVjdDogW1BBVENIXSBudmlkaWFm
YjogZGV0ZWN0IHRoZSBoYXJkd2FyZSBzdXBwb3J0IGJlZm9yZSByZW1vdmluZwogY29uc29sZS4K
ClRoaXMgZHJpdmVyIHJlbW92ZWQgdGhlIGNvbnNvbGUsIGJ1dCBoYXNuJ3QgeWV0IGRlY2lkZWQg
aWYgaXQgY291bGQKdGFrZSBvdmVyIHRoZSBjb25zb2xlIHlldC4gSW5zdGVhZCBvZiBkb2luZyB0
aGF0LCBwcm9iZSB0aGUgaHcgZm9yCnN1cHBvcnQgYW5kIHRoZW4gcmVtb3ZlIHRoZSBjb25zb2xl
IGFmdGVyd2FyZHMuCgpTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQu
Y29tPgpGaXhlczogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0y
MTY4NTkKUmVwb3J0ZWQtYnk6IFplbm8gRGF2YXR6IDx6ZGF2YXR6QGdtYWlsLmNvbT4KLS0tCiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udmlkaWEuYyB8IDgxICsrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZpZGlhLmMg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udmlkaWEuYwppbmRleCAxOTYwOTE2MDk4ZDQu
LmU2MGEyNzZiNDg1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZp
ZGlhLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZpZGlhLmMKQEAgLTExOTcs
MTcgKzExOTcsMTcgQEAgc3RhdGljIGludCBudmlkaWFfc2V0X2ZiaW5mbyhzdHJ1Y3QgZmJfaW5m
byAqaW5mbykKIAlyZXR1cm4gbnZpZGlhZmJfY2hlY2tfdmFyKCZpbmZvLT52YXIsIGluZm8pOwog
fQogCi1zdGF0aWMgdTMyIG52aWRpYV9nZXRfY2hpcHNldChzdHJ1Y3QgZmJfaW5mbyAqaW5mbykK
K3N0YXRpYyB1MzIgbnZpZGlhX2dldF9jaGlwc2V0KHN0cnVjdCBwY2lfZGV2ICpwY2lfZGV2LAor
CQkJICAgICAgdm9sYXRpbGUgdTMyIF9faW9tZW0gKlJFR1MpCiB7Ci0Jc3RydWN0IG52aWRpYV9w
YXIgKnBhciA9IGluZm8tPnBhcjsKLQl1MzIgaWQgPSAocGFyLT5wY2lfZGV2LT52ZW5kb3IgPDwg
MTYpIHwgcGFyLT5wY2lfZGV2LT5kZXZpY2U7CisJdTMyIGlkID0gKHBjaV9kZXYtPnZlbmRvciA8
PCAxNikgfCBwY2lfZGV2LT5kZXZpY2U7CiAKIAlwcmludGsoS0VSTl9JTkZPIFBGWCAiRGV2aWNl
IElEOiAleCBcbiIsIGlkKTsKIAogCWlmICgoaWQgJiAweGZmZjApID09IDB4MDBmMCB8fAogCSAg
ICAoaWQgJiAweGZmZjApID09IDB4MDJlMCkgewogCQkvKiBwY2ktZSAqLwotCQlpZCA9IE5WX1JE
MzIocGFyLT5SRUdTLCAweDE4MDApOworCQlpZCA9IE5WX1JEMzIoUkVHUywgMHgxODAwKTsKIAog
CQlpZiAoKGlkICYgMHgwMDAwZmZmZikgPT0gMHgwMDAwMTBERSkKIAkJCWlkID0gMHgxMERFMDAw
MCB8IChpZCA+PiAxNik7CkBAIC0xMjIwLDEyICsxMjIwLDExIEBAIHN0YXRpYyB1MzIgbnZpZGlh
X2dldF9jaGlwc2V0KHN0cnVjdCBmYl9pbmZvICppbmZvKQogCXJldHVybiBpZDsKIH0KIAotc3Rh
dGljIHUzMiBudmlkaWFfZ2V0X2FyY2goc3RydWN0IGZiX2luZm8gKmluZm8pCitzdGF0aWMgdTMy
IG52aWRpYV9nZXRfYXJjaCh1MzIgQ2hpcHNldCkKIHsKLQlzdHJ1Y3QgbnZpZGlhX3BhciAqcGFy
ID0gaW5mby0+cGFyOwogCXUzMiBhcmNoID0gMDsKIAotCXN3aXRjaCAocGFyLT5DaGlwc2V0ICYg
MHgwZmYwKSB7CisJc3dpdGNoIChDaGlwc2V0ICYgMHgwZmYwKSB7CiAJY2FzZSAweDAxMDA6CQkv
KiBHZUZvcmNlIDI1NiAqLwogCWNhc2UgMHgwMTEwOgkJLyogR2VGb3JjZTIgTVggKi8KIAljYXNl
IDB4MDE1MDoJCS8qIEdlRm9yY2UyICovCkBAIC0xMjc4LDE2ICsxMjc3LDQ0IEBAIHN0YXRpYyBp
bnQgbnZpZGlhZmJfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkLCBjb25zdCBzdHJ1Y3QgcGNpX2Rl
dmljZV9pZCAqZW50KQogCXN0cnVjdCBmYl9pbmZvICppbmZvOwogCXVuc2lnbmVkIHNob3J0IGNt
ZDsKIAlpbnQgcmV0OworCXZvbGF0aWxlIHUzMiBfX2lvbWVtICpSRUdTOworCWludCBDaGlwc2V0
OworCXUzMiBBcmNoaXRlY3R1cmU7CiAKIAlOVlRSQUNFX0VOVEVSKCk7CiAJYXNzZXJ0KHBkICE9
IE5VTEwpOwogCisJaWYgKHBjaV9lbmFibGVfZGV2aWNlKHBkKSkgeworCQlwcmludGsoS0VSTl9F
UlIgUEZYICJjYW5ub3QgZW5hYmxlIFBDSSBkZXZpY2VcbiIpOworCQlyZXR1cm4gLUVOT0RFVjsK
Kwl9CisKKwkvKiBlbmFibGUgSU8gYW5kIG1lbSBpZiBub3QgYWxyZWFkeSBkb25lICovCisJcGNp
X3JlYWRfY29uZmlnX3dvcmQocGQsIFBDSV9DT01NQU5ELCAmY21kKTsKKwljbWQgfD0gKFBDSV9D
T01NQU5EX0lPIHwgUENJX0NPTU1BTkRfTUVNT1JZKTsKKwlwY2lfd3JpdGVfY29uZmlnX3dvcmQo
cGQsIFBDSV9DT01NQU5ELCBjbWQpOworCisJbnZpZGlhZmJfZml4Lm1taW9fc3RhcnQgPSBwY2lf
cmVzb3VyY2Vfc3RhcnQocGQsIDApOworCW52aWRpYWZiX2ZpeC5tbWlvX2xlbiA9IHBjaV9yZXNv
dXJjZV9sZW4ocGQsIDApOworCisJUkVHUyA9IGlvcmVtYXAobnZpZGlhZmJfZml4Lm1taW9fc3Rh
cnQsIG52aWRpYWZiX2ZpeC5tbWlvX2xlbik7CisJaWYgKCFSRUdTKSB7CisJCXByaW50ayhLRVJO
X0VSUiBQRlggImNhbm5vdCBpb3JlbWFwIE1NSU8gYmFzZVxuIik7CisJCXJldHVybiAtRU5PREVW
OworCX0KKworCUNoaXBzZXQgPSBudmlkaWFfZ2V0X2NoaXBzZXQocGQsIFJFR1MpOworCUFyY2hp
dGVjdHVyZSA9IG52aWRpYV9nZXRfYXJjaChDaGlwc2V0KTsKKwlpZiAoQXJjaGl0ZWN0dXJlID09
IDApIHsKKwkJcHJpbnRrKEtFUk5fRVJSIFBGWCAidW5rbm93biBOVl9BUkNIXG4iKTsKKwkJZ290
byBlcnJfb3V0OworCX0KKwogCXJldCA9IGFwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lf
ZGV2aWNlcyhwZCwgIm52aWRpYWZiIik7CiAJaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkJZ290
byBlcnJfb3V0OwogCiAJaW5mbyA9IGZyYW1lYnVmZmVyX2FsbG9jKHNpemVvZihzdHJ1Y3QgbnZp
ZGlhX3BhciksICZwZC0+ZGV2KTsKLQogCWlmICghaW5mbykKIAkJZ290byBlcnJfb3V0OwogCkBA
IC0xMjk4LDExICsxMzI1LDYgQEAgc3RhdGljIGludCBudmlkaWFmYl9wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqcGQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCiAJaWYgKGluZm8tPnBp
eG1hcC5hZGRyID09IE5VTEwpCiAJCWdvdG8gZXJyX291dF9rZnJlZTsKIAotCWlmIChwY2lfZW5h
YmxlX2RldmljZShwZCkpIHsKLQkJcHJpbnRrKEtFUk5fRVJSIFBGWCAiY2Fubm90IGVuYWJsZSBQ
Q0kgZGV2aWNlXG4iKTsKLQkJZ290byBlcnJfb3V0X2VuYWJsZTsKLQl9Ci0KIAlpZiAocGNpX3Jl
cXVlc3RfcmVnaW9ucyhwZCwgIm52aWRpYWZiIikpIHsKIAkJcHJpbnRrKEtFUk5fRVJSIFBGWCAi
Y2Fubm90IHJlcXVlc3QgUENJIHJlZ2lvbnNcbiIpOwogCQlnb3RvIGVycl9vdXRfZW5hYmxlOwpA
QCAtMTMxOCwzNCArMTM0MCwxNyBAQCBzdGF0aWMgaW50IG52aWRpYWZiX3Byb2JlKHN0cnVjdCBw
Y2lfZGV2ICpwZCwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKIAlwYXItPnBhbmVs
dHdlYWsgPSBwYW5lbHR3ZWFrOwogCXBhci0+cmV2ZXJzZV9pMmMgPSByZXZlcnNlX2kyYzsKIAot
CS8qIGVuYWJsZSBJTyBhbmQgbWVtIGlmIG5vdCBhbHJlYWR5IGRvbmUgKi8KLQlwY2lfcmVhZF9j
b25maWdfd29yZChwZCwgUENJX0NPTU1BTkQsICZjbWQpOwotCWNtZCB8PSAoUENJX0NPTU1BTkRf
SU8gfCBQQ0lfQ09NTUFORF9NRU1PUlkpOwotCXBjaV93cml0ZV9jb25maWdfd29yZChwZCwgUENJ
X0NPTU1BTkQsIGNtZCk7Ci0KLQludmlkaWFmYl9maXgubW1pb19zdGFydCA9IHBjaV9yZXNvdXJj
ZV9zdGFydChwZCwgMCk7CiAJbnZpZGlhZmJfZml4LnNtZW1fc3RhcnQgPSBwY2lfcmVzb3VyY2Vf
c3RhcnQocGQsIDEpOwotCW52aWRpYWZiX2ZpeC5tbWlvX2xlbiA9IHBjaV9yZXNvdXJjZV9sZW4o
cGQsIDApOwotCi0JcGFyLT5SRUdTID0gaW9yZW1hcChudmlkaWFmYl9maXgubW1pb19zdGFydCwg
bnZpZGlhZmJfZml4Lm1taW9fbGVuKTsKIAotCWlmICghcGFyLT5SRUdTKSB7Ci0JCXByaW50ayhL
RVJOX0VSUiBQRlggImNhbm5vdCBpb3JlbWFwIE1NSU8gYmFzZVxuIik7Ci0JCWdvdG8gZXJyX291
dF9mcmVlX2Jhc2UwOwotCX0KKwlwYXItPlJFR1MgPSBSRUdTOwogCi0JcGFyLT5DaGlwc2V0ID0g
bnZpZGlhX2dldF9jaGlwc2V0KGluZm8pOwotCXBhci0+QXJjaGl0ZWN0dXJlID0gbnZpZGlhX2dl
dF9hcmNoKGluZm8pOwotCi0JaWYgKHBhci0+QXJjaGl0ZWN0dXJlID09IDApIHsKLQkJcHJpbnRr
KEtFUk5fRVJSIFBGWCAidW5rbm93biBOVl9BUkNIXG4iKTsKLQkJZ290byBlcnJfb3V0X2FyY2g7
Ci0JfQorCXBhci0+Q2hpcHNldCA9IENoaXBzZXQ7CisJcGFyLT5BcmNoaXRlY3R1cmUgPSBBcmNo
aXRlY3R1cmU7CiAKIAlzcHJpbnRmKG52aWRpYWZiX2ZpeC5pZCwgIk5WJXgiLCAocGQtPmRldmlj
ZSAmIDB4MGZmMCkgPj4gNCk7CiAKIAlpZiAoTlZDb21tb25TZXR1cChpbmZvKSkKLQkJZ290byBl
cnJfb3V0X2FyY2g7CisJCWdvdG8gZXJyX291dF9mcmVlX2Jhc2UwOwogCiAJcGFyLT5GYkFkZHJl
c3MgPSBudmlkaWFmYl9maXguc21lbV9zdGFydDsKIAlwYXItPkZiTWFwU2l6ZSA9IHBhci0+UmFt
QW1vdW50S0J5dGVzICogMTAyNDsKQEAgLTE0MDEsNyArMTQwNiw2IEBAIHN0YXRpYyBpbnQgbnZp
ZGlhZmJfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9p
ZCAqZW50KQogCQlnb3RvIGVycl9vdXRfaW91bm1hcF9mYjsKIAl9CiAKLQogCXByaW50ayhLRVJO
X0lORk8gUEZYCiAJICAgICAgICJQQ0kgblZpZGlhICVzIGZyYW1lYnVmZmVyICglZE1CIEAgMHgl
bFgpXG4iLAogCSAgICAgICBpbmZvLT5maXguaWQsCkBAIC0xNDE1LDE1ICsxNDE5LDE0IEBAIHN0
YXRpYyBpbnQgbnZpZGlhZmJfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkLCBjb25zdCBzdHJ1Y3Qg
cGNpX2RldmljZV9pZCAqZW50KQogZXJyX291dF9mcmVlX2Jhc2UxOgogCWZiX2Rlc3Ryb3lfbW9k
ZWRiKGluZm8tPm1vbnNwZWNzLm1vZGVkYik7CiAJbnZpZGlhX2RlbGV0ZV9pMmNfYnVzc2VzKHBh
cik7Ci1lcnJfb3V0X2FyY2g6Ci0JaW91bm1hcChwYXItPlJFR1MpOwotIGVycl9vdXRfZnJlZV9i
YXNlMDoKK2Vycl9vdXRfZnJlZV9iYXNlMDoKIAlwY2lfcmVsZWFzZV9yZWdpb25zKHBkKTsKIGVy
cl9vdXRfZW5hYmxlOgogCWtmcmVlKGluZm8tPnBpeG1hcC5hZGRyKTsKIGVycl9vdXRfa2ZyZWU6
CiAJZnJhbWVidWZmZXJfcmVsZWFzZShpbmZvKTsKIGVycl9vdXQ6CisJaW91bm1hcChSRUdTKTsK
IAlyZXR1cm4gLUVOT0RFVjsKIH0KIAotLSAKMi4zOC4xCgo=
--0000000000003403e205f403fd13--

