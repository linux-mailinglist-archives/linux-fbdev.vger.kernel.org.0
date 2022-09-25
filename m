Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C41325E9349
	for <lists+linux-fbdev@lfdr.de>; Sun, 25 Sep 2022 15:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiIYNJ6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 25 Sep 2022 09:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiIYNJ5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 25 Sep 2022 09:09:57 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0904C183A9
        for <linux-fbdev@vger.kernel.org>; Sun, 25 Sep 2022 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664111388;
        bh=DfbD/EJj3tj/5dC6E/1+wV9/d3hETrlzdslgTAoM4vk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=VjrV5/Y3cdudtrbeK4VVYS3FfRY9hS85w3XwL6uRSdG02t2G8j4DY4mCEEQcuK6B5
         DpWrkHYYuN08Qk4V/uln2+qorE4mmflh+kwgp9X6qLRjl9r0rzumWTgF/75UasXRVy
         7c/SoaAxRrGv6EpEk5AwpH5aM4SC496v34M6LRkE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MN5eX-1ovLib1rMb-00J5oY; Sun, 25
 Sep 2022 15:09:48 +0200
Message-ID: <3eedfafb-f0ea-2d94-ae6e-fcf827e17378@gmx.de>
Date:   Sun, 25 Sep 2022 15:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] video: fbdev: smscufx: Fix use-after-free in
 ufx_ops_open()
Content-Language: en-US
To:     Hyunwoo Kim <imv4bel@gmail.com>, steve.glendinning@shawell.net
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220925123253.GA381917@ubuntu>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220925123253.GA381917@ubuntu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AKZosaNJMig//jZN2IFzJqjjH0cJ91mxTM/aXuhmBEI5zWIEctL
 fq672v7stHcLCVy83voXN8oA4SBVBx8f5hWG2gOpRA+Uy2qdnWyYhG3IhB665d+r4PieIL6
 xWnCy+Lu9exrsbIOjV8p+qXJ4RVdZ1KdgBMMKoiMCK61pYNEmKaqI61MvdM3zdV78wtzVwM
 ssnaTcvCi589OP7bSUUdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I+cQF+W9NZM=:7cTZEeKHmhFBg1qGqppoRA
 +nZwCxf4PFaIzqlMvp5s/YAWj17MJKdZsSHSEvLAI85RgrqcA2fZysD116CwdM4dvaUXxELF4
 K7KyVNXji6KspD66LPz/NQSMscXAqtb1V+oR2/YeZX/baGGA1eQdeTr5ou8RJsmqykIMMTUCY
 WEvhEX5+tnIvD6IfO6q8uCQH4RrhUF3lmJdxXFi/hJvYbg7b1yGP1TbBMOpSFLmj6AHKq6Jkv
 U9XfkcnFfy9fxUhsEFtLPirWmtxCU06S+IKRvWvzF50qLw5g2R9DmoWrG3Bal3H4g3e+256Eg
 ZGVh0u2IShvxyR2GH1+33rTBq430McoP9SMv7GniLhaHcEWnv/lRFtB7Jjy7YZ2cjrqDtyDxU
 koobW5XcIYFOGz6OnGeCLH2TrL6TetWs26nALUgjEH48zDkbG5VCs0CHHYOBmmEtf0wN5VAHu
 68eBuqgpp98YkFWU+53+7w+fxeWD1lMgnWlOnojdxLENMKE5kUVBbjbDN5J9dHnKraJxzcxXA
 Vbfzsik+X2e5fE6u0AoH8biEIWNv2K3lxZKzCs1PFPjUSGUOQZSBw8sxZ3pq1hxG8/pMBVEjJ
 6hmxhvwWwHE1dhGXfBg/SPT4WSopRco6jDYcNSmPUY2z6BULHJA5l6tG0MR9LUfCwZuXXSP6/
 ZPJd7WgpSfu8+XwJ2yNNt7fawzYrNEjrM7XKvBVNlOIB5N2xAVWNG88OFT25e3aHhlKIcKkI9
 FNA+qAMbCUJuAJ+V35aafunBLOLRf6Yygx0IUeQdd/VcTdrN7r1GJTN5jAaMsoUQ2Va7v3nsg
 Tqberj6ptJ6fQjcZ3t0nMc6XqxUHCXLlq7HwvRZ+y6DfjaQBdDjh8GRtNdAJI3Nq8D1av5wUg
 gCtDNhEI4V+bhDf96gH1GYlS+zIOORSEmbazNs97IrZzQACCwUGJCOtnDH175UvnUP1LyUpRZ
 dFpCdx20TrmqYtUokMZy9rho5+LOEtjrf0xc2S2mQ67D9FhXnW8t8YUjIu77Ouss1taJDy6X/
 eBxL4rjzUUl8S/cSFw4/Bfqur+E+GtvUCwoa1sUPllQ+VAcrFFpgx6/HKe4uI/mSYz7iabBf5
 5SWhRl/6tYBlnhJMHY8qLNxrB4GKjSlBoSzG5kIL8F/nA0g9JnPTqrCXzveh6R8nevXJHr+E/
 fTuL/CsZWg7Hc84y8YXLAplij0
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 9/25/22 14:32, Hyunwoo Kim wrote:
> A race condition may occur if the user physically removes the
> USB device while calling open() for this device node.
>
> This is a race condition between the ufx_ops_open() function and
> the ufx_usb_disconnect() function, which may eventually result in UAF.
>
> So, add a mutex to the ufx_ops_open() and ufx_usb_disconnect() functions
> to avoid race contidion of krefs.
>
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> ---
>   drivers/video/fbdev/smscufx.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx=
.c
> index d7aa5511c361..02a22e31e9c0 100644
> --- a/drivers/video/fbdev/smscufx.c
> +++ b/drivers/video/fbdev/smscufx.c
> @@ -137,6 +137,8 @@ static int ufx_submit_urb(struct ufx_data *dev, stru=
ct urb * urb, size_t len);
>   static int ufx_alloc_urb_list(struct ufx_data *dev, int count, size_t =
size);
>   static void ufx_free_urb_list(struct ufx_data *dev);
>
> +static DEFINE_MUTEX(disconnect_mutex);
> +
>   /* reads a control register */
>   static int ufx_reg_read(struct ufx_data *dev, u32 index, u32 *data)
>   {
> @@ -1065,15 +1067,21 @@ static int ufx_ops_open(struct fb_info *info, in=
t user)
>   {
>   	struct ufx_data *dev =3D info->par;
>
> +	mutex_lock(&disconnect_mutex);
> +
>   	/* fbcon aggressively connects to first framebuffer it finds,
>   	 * preventing other clients (X) from working properly. Usually
>   	 * not what the user wants. Fail by default with option to enable. */
> -	if (user =3D=3D 0 && !console)
> +	if (user =3D=3D 0 && !console) {
> +		mutex_unlock(&disconnect_mutex);
>   		return -EBUSY;

it seems user and console don't need to be protected by the lock.
Does it make sense to move them out of the lock?

Helge
