Return-Path: <linux-fbdev+bounces-654-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC18331D0
	for <lists+linux-fbdev@lfdr.de>; Sat, 20 Jan 2024 01:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A16C1C217B0
	for <lists+linux-fbdev@lfdr.de>; Sat, 20 Jan 2024 00:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0407A4A;
	Sat, 20 Jan 2024 00:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="eI01Ecai"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CB9A3C;
	Sat, 20 Jan 2024 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705710486; cv=none; b=s5jDER2wvg1fjB8DPwx8W48ZWGmQGEFu+xUdJqjpzwkfSCy5IQZ803eIsBwyJ2Qt2+0cFKbbjsNcUt4z53Yiv+kaYF1amBfj3ueryhxVGmf4rYy354y9zajIEWneh2NCs+rU2ECJyQY5EPYdpGO3j9NQkk/rHU4iGhm3mmhMfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705710486; c=relaxed/simple;
	bh=EBQrlDiuz9EgZmLfeAeEmDY6zzej7dk/4u6PJ/BrtDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtfRimyfvWtOOei+ZZplJI2Kz1T15rIZSerHSsc/+PVVxfAmiJs/owRsC48GTw+68e0O9e9ez5231m6ee5fX2/xZWPQiLNlLOElO0vNdClAGMrphR9Zeecs1M7WI7Vxd4Y/3GyJfMvFp6YWabN92emDs3CloUhsCjwg6AvtGM/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=eI01Ecai; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1705710461; x=1706315261; i=deller@gmx.de;
	bh=EBQrlDiuz9EgZmLfeAeEmDY6zzej7dk/4u6PJ/BrtDo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=eI01Ecai5ZOiSGvW4QmvM03/MKY7v6ic7AtooEloZLaRH2agYDH+SLPREtoNEQh6
	 naiBQwsQONwHNQUfsw33eQojLtH/XeNyDM9qUhMaoYt8FjKu6XAOLHEiSfvCO+00n
	 Mb+psU8pjBdvil6lmbirG6fHwY/WMTWArJ23FOVPKDfKmuccvALVok1ksqskE6sxN
	 8ZmL/JtN0eJBhY0Ld7+xW/VY3lDGrC/YEPdssz2PpL4Cxxhw0t3w4RP7+g1F3wVDl
	 WDPsrrs/47J9ndxNWdQQkpXzIIkhKusrfskN2ouOPe7ocatsKGF/V8jHl0x6UGqOt
	 sBQJDk6WPFmns1/llg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.146.202]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf0U-1qibpn1FlC-00ilMS; Sat, 20
 Jan 2024 01:27:41 +0100
Message-ID: <2c267aef-f1a7-4277-aac6-75d9ea22ec03@gmx.de>
Date: Sat, 20 Jan 2024 01:27:40 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION: no console on current -git
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: avier Martinez Canillas <javierm@redhat.com>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
References: <05ea3233-20dd-4af7-86cc-de11ad2efe84@kernel.dk>
 <0293b14b-6188-4229-9fb6-29fbbdb8dc83@gmx.de>
 <9e09464a-d58c-4f17-9318-26f0813a3023@kernel.dk>
 <b6350dac-0be6-45f9-9309-d196ea455dea@gmx.de>
 <017a1df5-e08b-44c5-9e4e-f61a9ce49e8d@kernel.dk>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <017a1df5-e08b-44c5-9e4e-f61a9ce49e8d@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NjkEqKEyNYJwFpO79gmq/uemm7g60TO0PeqVm2qRazYinxcvMc0
 ijvNWtW5XbtuAsdVMBSGG/d6RWEDB0ZQ2IiGuUGVQCTGhzAXvsqzgpVGDDegSnT5suvyBw1
 4NTGGsH/mujrMVWY6a0+N5lJ2BwODWHUSc3KuKx9/invpPXyBJpMF9GuloDcs2JqMVZw5CT
 aHcksb3JRVdw/qK/4halw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JmG9h4bE3M8=;tPiDxcM8l3PAHdgckmotq5CHERO
 1Vkws5JGoi1dksGtIbvGmMRYQr4OSMP80ifZ7wjdIZg7XCXm8dBOXTDR/BZZ7vuzIK7+K/ku8
 n9R0SU3zZvFOQx7ofpGeEOdxrtuC3ILfO8b6e44WQmaaJKZuljBIc7U8EF8e4Efctlz/lcqNF
 4dnmaIpI1gwpg5Z+b4xUuyiu6u/amMy9W/gidBQlAmLyYbuhPGpp2uOb4Miq1mbcp/1VABiLI
 IY9l7QH4I+GiN3gn024wtxEyY5772/tLIwDf2qbaC7CnosL3Vls3KVzIG4H2TYEGtmxOet4mQ
 3iCKcQikzZhiF/ZKEHjZzg4ydaQHm6paFW8r6EhZ20DDvotyZrDJSiZfHCV+/6J16r67w9Axq
 cbc5ho+Y7KsIHBrVrM80QRSUUJRt4w4bfWaXUMRriqcKpYfbV3PXstv1YHJxk2h1EJSSNrYEA
 UUHkG1muV4fGw4DLkWnPzX90vZ1a+kX3YjkOcSs9XWE2ZyBgpVbKT9fGidLqbkvM1pQy7Y1bO
 i7LvKitGpjxns67E+vwbYOF99VbVGbEC82JieSyjE6o7sXQufCy7mR2Fe6vF1x9cDzkSWsQxP
 AbzhQlwH9jwmrlEqwo3gyHhAGyh9+n+Is2qJ3SUDrv82pvBEicZHGer7RfVqvSO4twKjdRdzm
 uUYIG3HMq4zH0JFEoojxPICjg/EhKJ/YgsEVwuTrZd/cD2J0ihcAM3IRpXWcGgNHjNSpzaPGd
 eUkKMipg8B95v2T6QMfB6x7SgCIiwa1gtgwSViRM9TFUtuj5Qak/WTq8xoAFwRkel5NtZTDV/
 xQRgFsqx3BANeTMnFTJB5cAlTqac+A+XmV81yq0IhndTnQaOJxJe/d2ojfeGWkujJTJ/8yOm1
 fq0BHssRQdEPHVGmIVIgtVw2KpIAbdD/A3JWVwAmNH9VJfgQO9LAR/L4ZSQlIkudki7po7RBG
 8P18Nmd5Gt2NU8LIhFHapIZjQZA=

On 1/19/24 22:22, Jens Axboe wrote:
> On 1/19/24 2:14 PM, Helge Deller wrote:
>> On 1/19/24 22:01, Jens Axboe wrote:
>>> On 1/19/24 1:55 PM, Helge Deller wrote:
>>>> Adding Mirsad Todorovac (who reported a similar issue).
>>>>
>>>> On 1/19/24 19:39, Jens Axboe wrote:
>>>>> My trusty R7525 test box is failing to show a console, or in fact an=
ything,
>>>>> on current -git. There's no output after:
>>>>>
>>>>> Loading Linux 6.7.0+ ...
>>>>> Loading initial ramdisk ...
>>>>>
>>>>> and I don't get a console up. I went through the bisection pain and
>>>>> found this was the culprit:
>>>>>
>>>>> commit df67699c9cb0ceb70f6cc60630ca938c06773eda
>>>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Date:   Wed Jan 3 11:15:11 2024 +0100
>>>>>
>>>>>        firmware/sysfb: Clear screen_info state after consuming it
>>>>>
>>>>> Reverting this commit, and everything is fine. Looking at dmesg with=
 a
>>>>> buggy kernel, I get no frame or fb messages. On a good kernel, it lo=
oks
>>>>> ilke this:
>>>>>
>>>>> [    1.416486] efifb: probing for efifb
>>>>> [    1.416602] efifb: framebuffer at 0xde000000, using 3072k, total =
3072k
>>>>> [    1.416605] efifb: mode is 1024x768x32, linelength=3D4096, pages=
=3D1
>>>>> [    1.416607] efifb: scrolling: redraw
>>>>> [    1.416608] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
>>>>> [    1.449746] fb0: EFI VGA frame buffer device
>>>>>
>>>>> Happy to test a fix, or barring that, can someone just revert this
>>>>> commit please?
>>>>
>>>> I've temporarily added a revert patch into the fbdev for-next tree fo=
r now,
>>>> so people should not face the issue in the for-next series:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.gi=
t/commit/?h=3Dfor-next
>>>> I'd like to wait for Thomas to return on monday to check the issue
>>>> as there are some other upcoming patches in this area from him.
>>>
>>> Given the issue (and that I'm not the only one reporting it), can we
>>> please just get that pushed so it'll make -rc1? It can always get
>>> re-introduced in a fixed fashion. I don't run -next here, I rely on
>>> mainline working for my testing.
>>
>> I agree, it would be good to get it fixed for -rc1.
>> So, it's ok for me, but I won't be able to test the revert short time r=
ight now.
>> If you can assure that the revert fixes it, and builds in git-head,
>> I can now prepare the pull request for Linus now (or he just reverts
>> commit df67699c9cb0 manually).
>
> I already tested a revert on top of the current tree, and it builds just
> fine and boots with a working console. So reverting it does work and
> solves the issue.

I sent a pull request with the revert.

Thanks!
Helge


