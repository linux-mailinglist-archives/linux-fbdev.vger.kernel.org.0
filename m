Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573674A7839
	for <lists+linux-fbdev@lfdr.de>; Wed,  2 Feb 2022 19:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346750AbiBBSte (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 2 Feb 2022 13:49:34 -0500
Received: from mout.gmx.net ([212.227.15.19]:33327 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346631AbiBBStd (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 2 Feb 2022 13:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1643827768;
        bh=cRz8qbHdrWP6Wqf9ZBWf6XGW8RcaJPDmLj3QbU1FZew=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=jTSj/nkFAbPxs4ZCVbMoPu30266cTpPDV5mUvHH+eKriIsmFRBdiTKy+57cqn0Bhm
         hrj/Nd3LiQpP/ph7dr1zld5TLRTLugMvvodzsvlGGMOnWAwm7FLNSruBj7NXlc7Wc6
         rxUtyUyU9P//QB3Pu34BJm1204OIDW7LMAia3V9o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MirjS-1mcgYF3W0i-00etwB; Wed, 02
 Feb 2022 19:49:27 +0100
Message-ID: <308b274b-3783-6e33-f956-e5d026e6681b@gmx.de>
Date:   Wed, 2 Feb 2022 19:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: fbdev git tree update
Content-Language: en-US
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-fbdev@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>
References: <e1e5b7d1-ea09-6e28-9c39-45b983734a85@gmx.de>
 <YfrFvfZuZM1N9frh@ravnborg.org> <76ed4203-1ddc-1bbf-39c8-7cb62de7f4e9@gmx.de>
 <YfrP5AELHkN85/z4@ravnborg.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <YfrP5AELHkN85/z4@ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2U8eGnmLG5oNZ86SNf4jNJq1Aw5MViF1A5BkQi9aELSbeh/uVlo
 gg3cXxGUxS2yYzmufwJMGAv/W7z8x0KRIptIBjTXyiIY9LfLai7p+ZbWXJ7z4e4eejIeaZx
 w+spCzK43jacgxpklk/IBJIdsRTeUteo9Tlol3BlDOK1FQ7BumoJC7tfe1C8la3jvNoh3fW
 PgNrzwlAnsiGXJlhw6tJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ktm7gmbKTWM=:FFK0/GtW2nq4rPcqP8LDl7
 kZiDTOHV+k9ralDaI2DhsK2fJl6YqsuqhzjQ/ZqrACvBppBCkarZ/tFUngx4P9LYpcjBx9ebb
 Wurdrawr2Txki5kTkfSrgJxM6E0DuvPRQmSHY1OyVdceZPJxFzmVhXv2sb1pGAdkGqKVEAw7+
 hgHhG8hR9nlCsL1pUK5mkHQ7DS9eByg7qihKU8l4WAfmNgm0rJShKxZsuq+SxNYr8h4IFebiN
 XUNhfOozXLlH2fQdcUkwz03Lwyi3bC7wkjN9WOi5CdvkrREX1GPfstRyEbbwk8HsRhqJFGSyf
 Ar360ItxhF1KbdIANEdMKZzFGajmiKMbwnwcJ9DvfRfJETCXtsJ4Sim/eHKvyf/e5Is5vGsgf
 LsLv/y32+se1zPyx2iI9BKBGMe08o0cLObwtHOq7YWWj2kc+f/ZM5L0SMh3y/sZeakU08hMAE
 MvVcN1gCwXYcUDz3kGhNL0EfN6h73We8TX3D1Lnop7jtV2JIB7UJvNY4Jr8TJTz9+4eeeOlwF
 RU+xG4yC01V78f2Tk3Nv/bs3hxYwcjz0wZah7jgVV92CtSV88aDrjzypiBNtBAEMoBGHafEaO
 3FkX67jnD1pJjE/mgFA8JL8+Q2GH62Q90Yv7yhPlN5HWnbhytFZcrZtmaLm2g49z5N9/DPXG9
 DVrM+ZvX8h5DpJD4Pr/RQMxme+2mSrntx2vbOFU2yMtkk3I48TP8VIjRR/AQ7jiEspH+JvszA
 mzwKAJ7Chkwsq/Q4gFgwBlqA83GGXt8WRlbbb0LRnR0PPsQfAoKsVc3vFH1y+w1qKHSt6n4lp
 ClU7NmxX2mSgfjbXRGXO9hGnZLzrYU8SgEX0ZPJ/oquMVeQOW0dfm1YShM1xPVaOTI0eAkGp2
 QWrPR8DenahAzrG0qAwQQseAzKKmXghsZqSjCAICp72uNpjYjxB+ZcDvnyfxd7JqPSwY7Vaeq
 LMyuTsGgyKbkHrIz1HJG+xTlHW0Vm9JCRdZu4hd+5ExGmsP/bFXmpJM1jwmNsfL0lujhcik0l
 Bvr+Mu8Y/jwPDL/gQZz5mnbjQSvpDsA33qBoBFIi3cU4EoU6z8iT/8TtOBkBW2ZC3zSrxE5gt
 oCbyVii8mvFG+U=
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello Sam,

On 2/2/22 19:39, Sam Ravnborg wrote:
> Hi Helge,
>>
>>> How come there are backlight, dt-bindings
>>
>> I didn't know, and I picked up those at the beginning.
>> I did agreed with the backlight maintainers that I should
>> keep those which are already in my tree, and that I will ignore
>> any upcoming new ones.
> Fine, just include this in the cover letter to explain it.

Ok, I'll do.

>>> and agp in between the fbdev patches?
>>
>> It wasn't picked up yet, agp somehow belongs to fbdev and as
>> maintainer for parisc I was somehow involved as well.
>> I'm happy to drop it if you think it belongs somewhere else...
>
> I see no point in dropping as you are involved and patch seems relevant.
> But please explain this in the cover letter so readers are not left
> wondering.

Ok.

Thanks a lot for your feedback !
Helge
