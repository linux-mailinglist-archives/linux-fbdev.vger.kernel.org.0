Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1075A3D027
	for <lists+linux-fbdev@lfdr.de>; Tue, 11 Jun 2019 17:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388958AbfFKPEb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 11 Jun 2019 11:04:31 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51304 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389125AbfFKPEa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 11 Jun 2019 11:04:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so3346958wma.1
        for <linux-fbdev@vger.kernel.org>; Tue, 11 Jun 2019 08:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R5/uIi3bQ/ds3NIEa9OHmauK02hAqsI3koc3RXyB0Jg=;
        b=aItWpcZ1euZ1XRqLZo+yVkcrnbtmldG+t3cKwQSUwSFEm5l5vFDQGYioi3c7lcw6Kj
         3UMmTpUNvT2XfiWVgoPoX+wZyLL4n5Zu1uvPpXXRmn9cZUhpqMqy6UxbGckTp0FbMlvr
         GO1XWr/b44fgTVtQCD1HhcURtlzGlXOW7vn/pvsV7gTA8Y8ehWcnu/g869xAXt+AoBKa
         Q+yzQCgprFP8nFgNZK/UuVmrL9P0KGbs1DiExjnYaZYljIoZtCbD/flis6CIcco87OlW
         cF62Qf0Mr38Lrzf8gpkFQGUU9xrlX+wQQ0QRKK69Sg6xguDBfW5BOKDDKTPZtD1Nq4yY
         lp2w==
X-Gm-Message-State: APjAAAWlp7AgixGjJiOwGuKz7+Y+R3GD4oQeKzI780Zjqt4XYCrcStA6
        zQ1oCz8eP8v4V7IMOVTfdujWA1XNNmE=
X-Google-Smtp-Source: APXvYqzBscAg7jbeh5Xn9XEqpbYpAKy0hRsWKDmmp3zatLjV8e1MN27GAN407VYF0b8jdNxbywxSpQ==
X-Received: by 2002:a1c:a807:: with SMTP id r7mr17768542wme.137.1560265468401;
        Tue, 11 Jun 2019 08:04:28 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id f2sm2901250wmc.34.2019.06.11.08.04.27
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 08:04:27 -0700 (PDT)
Subject: Re: [PATCH] efifb: BGRT: Add check for new BGRT status field rotation
 bits
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Peter Jones <pjones@redhat.com>,
        linux-efi <linux-efi@vger.kernel.org>,
        "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>
References: <20190529154635.2659-1-hdegoede@redhat.com>
 <CAKv+Gu8bLcDROFNFfqHaN1Z+EK5bnXMNDSJbBK-pCmq5XP_kBw@mail.gmail.com>
 <CAKv+Gu8w2Vj-AS-cfaB8cms+ZJ7qppS-Du_334_xm51rz0CYsA@mail.gmail.com>
 <3065d32f-add7-4e48-164b-c248cc116cea@redhat.com>
 <CAKv+Gu8_+6MNtM3_muP8YqHYYij58LzRFgV_UPaWp4vbjPkm5w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a05daac4-7d54-ec32-618d-fd0f2d0d6641@redhat.com>
Date:   Tue, 11 Jun 2019 17:04:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu8_+6MNtM3_muP8YqHYYij58LzRFgV_UPaWp4vbjPkm5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

On 11-06-19 16:37, Ard Biesheuvel wrote:
> On Tue, 11 Jun 2019 at 16:24, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11-06-19 16:04, Ard Biesheuvel wrote:
>>> On Mon, 10 Jun 2019 at 17:12, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>>>>
>>>> On Wed, 29 May 2019 at 17:46, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Starting with ACPI 6.2 bits 1 and 2 of the BGRT status field are no longer
>>>>> reserved. These bits are now used to indicate if the image needs to be
>>>>> rotated before being displayed.
>>>>>
>>>>> The efifb code does not support rotating the image before copying it to
>>>>> the screen.
>>>>>
>>>>> This commit adds a check for these new bits and if they are set leaves the
>>>>> fb contents as is instead of trying to use the un-rotated BGRT image.
>>>>>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>
>>>> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>>>
>>>
>>> BTW should we make sure that this patch and the efi-bgrt patch get
>>> merged at the same time?
>>
>> The 2 patches are related but merging them at the same time is not
>> necessary.
>>
>>> I guess the net result is just that we get
>>> rid of some error in the log, but a rotated BMP will be ignored
>>> otherwise.
>>
>> Right, worse case (if the bmp fits pre-rotation) it will be displayed
>> rotated. Note on the one machine I'm aware of which uses these bits
>> the bmp does not fit pre-rotation, so we end up triggering:
>>
>> error:
>>           memunmap(bgrt_image);
>>           pr_warn("efifb: Ignoring BGRT: unexpected or invalid BMP data\n");
>> }
>>
> 
> Doesn't that mean we may now end up breaking 'quiet', by exchanging a
> pr_notice() in the efi-bgrt driver for a pr_warn() in this one?

quiet has only logged pr_err and more severe for as long as I can
remember, so notice / warn does not matter for quiet.

Also for flickerfree boot I've made the quiet cut-off configurable
(CONFIG_CONSOLE_LOGLEVEL_QUIET) and in Fedora at least we set it to only
show messages at KERN_CRIT and more severe levels, since there are
simply too many false-positive pr_err messages in the kernel and
I quickly got tired of the whack-a-mole game.

Regards,

Hans
