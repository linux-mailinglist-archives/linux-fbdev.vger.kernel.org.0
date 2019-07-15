Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CACCE6957E
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Jul 2019 16:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391576AbfGOO6N (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 15 Jul 2019 10:58:13 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34297 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391312AbfGOO6M (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 15 Jul 2019 10:58:12 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 90B8A22270;
        Mon, 15 Jul 2019 10:58:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Jul 2019 10:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaseg.net; h=
        subject:references:to:cc:in-reply-to:from:message-id:date
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        ymTeSHX0Vj7NaZZc1W0N02Ut30dn0Qy41Obnj4AdJ8Q=; b=DfwBYCBR/FsV4J8q
        am62UWkN7x01LRDw08wkhThheuXtDu/Sawto7jvkPsr2LtcQ3OchaeGLuXzPYyOs
        suDikehFCID+GH26xKxx7zB8UAS0UKwUNVVLHNQS5PR1Sh9OOXxN2i6HplUBECpP
        DvJ4F9gZ4nrmQWvLSBHb0vsdmZ5RFKkX5eNtm9krhQ3WO8kLis2l4HHbzt1+khdy
        zKIeVzaD2VfNadl4pQZyjQWxC0lE+lZKvqDk7sKvSF0uwQOzgBfc2HWbjCaIkqc/
        8GtLVsmDMDoA6F4UH/stoGrb2PBiBd4XCUb6ZuUm/b5EIGyzw5YvRrrs3GTzylLZ
        UVqevg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=ymTeSHX0Vj7NaZZc1W0N02Ut30dn0Qy41Obnj4AdJ
        8Q=; b=RwTBx2lkQBL/l68qnSVOISfctCGVXkatI1Ly3FSiObdVVpc1fpsy+7Szm
        m2Ai6rFzW26ehr7Gb8LSXpes0EnO+w0ctgNAgdxYq4s6FHJbbhGzhVgFGR2Ya/A7
        AQOLo2bBqhDRAVpoffHZP0ADp3Fg4UCU14O0w3WeU7UcjGOz4AUPIL/ZSV6jf8x4
        yN7m+9cfrIXlhHHBbMWfEvDSHYSZKdeU/DEDM20jte9UAivYI19b/oe5ehPPHpby
        D+Mud0elDGLbJ7TOE42In69RAl7CePSdjv/MSwgZMzPH7kdw+Gja9rRQ44vDvtaP
        QhrGW1u82YVLx7XCa1Klt4HD2THVw==
X-ME-Sender: <xms:f5QsXf956g-XA0MKS23TtjBSxU-qd3wUFit5hQLjvGzZOA5plxW3aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrheekgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefufhfvjgfhkffffgggtgfgsehtjeertddtfeehnecuhfhrohhmpeflrghnpgfu
    vggsrghsthhirghnpgfinphtthgvuceolhhinhhugiesjhgrshgvghdrnhgvtheqnecukf
    hppeeitddrjedurdeifedrjeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlihhnuhig
    sehjrghsvghgrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:f5QsXTkWMCQu1V_1zvquLfv-vuCTfznbD3DuuB57y675WAPGtqX9dA>
    <xmx:f5QsXcYLsDpjOneWh_PaE882bsGDwbvlX4LQJILicfBcJ6ienmw7zA>
    <xmx:f5QsXTNvYsr8pIJR1DVBRzQhMtF2QygyiCQ8m3nNd4S3IJDqQJAnNw>
    <xmx:gZQsXaEgxMZbffTWgFyXU-TDSZanNnaX5QQJ4bn9rel8ukUP1vzXcw>
Received: from [10.137.0.16] (softbank060071063075.bbtec.net [60.71.63.75])
        by mail.messagingengine.com (Postfix) with ESMTPA id 98CF080059;
        Mon, 15 Jul 2019 10:58:04 -0400 (EDT)
Subject: Re: [PATCH] Staging: fbtft: Fix wrong check
 in,fbtft_write_wmem16_bus8()
References: <20190715143003.12819-1-nsaenzjulienne@suse.de>
 <7b8242ab-cc0c-d90b-60af-ff1c53789e44@opensynergy.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Phil Reid <preid@electromag.com.au>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>,
        nishadkamdar@gmail.com, bhanusreemahesh@gmail.com,
        leobras.c@gmail.com, gregkh@linuxfoundation.org,
        linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org
In-Reply-To: <7b8242ab-cc0c-d90b-60af-ff1c53789e44@opensynergy.com>
From:   =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
Message-ID: <5a77c18f-7338-888f-2379-12171b6a545e@jaseg.net>
Date:   Mon, 15 Jul 2019 23:58:01 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Coincidentially, I've worked on the exact same issue this weekend. I can confirm this change is necessary, and with this and the other two patches from Phil Reid the driver works again. The same mistake occurred in several other locations, though. I'll send a patch fixing all of them.

I've tested this on a ili9486-based display connected to a raspberry pi 3b+.

Regards, Jan

On Mon, 15 Jul 2019 Nicolas Saenz Julienne wrote:
> We actually want to set the gpio pin if it's avilable, not the other way
> around.
> 
> Fixes: c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor
> interface")
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  drivers/staging/fbtft/fbtft-bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-bus.c
> b/drivers/staging/fbtft/fbtft-bus.c
> index 2ea814d0dca5..63c65dd67b17 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -135,7 +135,7 @@ int fbtft_write_vmem16_bus8(struct fbtft_par *par,
> size_t offset, size_t len)
>         remain = len / 2;
>         vmem16 = (u16 *)(par->info->screen_buffer + offset);
>  -      if (!par->gpio.dc)
> +       if (par->gpio.dc)
>                 gpiod_set_value(par->gpio.dc, 1);
>         /* non buffered write */
> --
> 2.22.0

