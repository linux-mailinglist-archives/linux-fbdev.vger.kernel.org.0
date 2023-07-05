Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22B8C7486D4
	for <lists+linux-fbdev@lfdr.de>; Wed,  5 Jul 2023 16:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbjGEOvI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-fbdev@lfdr.de>); Wed, 5 Jul 2023 10:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbjGEOvH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 5 Jul 2023 10:51:07 -0400
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88494131;
        Wed,  5 Jul 2023 07:51:06 -0700 (PDT)
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
        by unicorn.mansr.com (Postfix) with ESMTPS id 639AE15360;
        Wed,  5 Jul 2023 15:51:05 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
        id 4E1D1219FC1; Wed,  5 Jul 2023 15:51:05 +0100 (BST)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: led_bl: fix initial power state
References: <20230705142447.15546-1-mans@mansr.com>
        <20230705143320.GE6265@aspen.lan> <yw1xjzvezapt.fsf@mansr.com>
        <20230705144406.GA9021@aspen.lan>
Date:   Wed, 05 Jul 2023 15:51:05 +0100
In-Reply-To: <20230705144406.GA9021@aspen.lan> (Daniel Thompson's message of
        "Wed, 5 Jul 2023 15:44:06 +0100")
Message-ID: <yw1xfs62za1y.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Daniel Thompson <daniel.thompson@linaro.org> writes:

> On Wed, Jul 05, 2023 at 03:36:46PM +0100, M�ns Rullg�rd wrote:
>> Daniel Thompson <daniel.thompson@linaro.org> writes:
>>
>> > On Wed, Jul 05, 2023 at 03:24:14PM +0100, Mans Rullgard wrote:
>> >> The condition for the initial power state based on the default
>> >> brightness value is reversed.  Fix it.
>> >>
>> >> Furthermore, use the actual state of the LEDs rather than the default
>> >> brightness specified in the devicetree as the latter should not cause
>> >> the backlight to be automatically turned on.
>> >>
>> >> If the backlight device is not linked to any display, set the initial
>> >> power to on unconditionally.
>> >>
>> >> Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
>> >> Signed-off-by: Mans Rullgard <mans@mansr.com>
>> >> ---
>> >> Changes in v3:
>> >> - Add comment
>> >
>> > This mismatches the subject line ;-) but I can live with that if Lee
>> > and Jingoo can!
>>
>> Does it not fix it?  If you think the subject is misleading, feel free
>> to change it.
>
> The bit that goes into version control is fine!
>
> However without '[PATCH v3]' on the subject line for the initial patch
> there is a risk this thread will get overlooked and not queued[1].

Oh, I see now I forgot to add the v3 tag.  Sorry about that.

-- 
M�ns Rullg�rd
