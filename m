Return-Path: <linux-fbdev+bounces-658-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC97E83359C
	for <lists+linux-fbdev@lfdr.de>; Sat, 20 Jan 2024 19:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 079671C20D54
	for <lists+linux-fbdev@lfdr.de>; Sat, 20 Jan 2024 18:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1F31172C;
	Sat, 20 Jan 2024 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b="kOqNv5Q2";
	dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b="m056Idew"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from domac.alu.hr (domac.alu.unizg.hr [161.53.235.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7600A10A38;
	Sat, 20 Jan 2024 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.53.235.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705774308; cv=none; b=sNfGaFXG7Zz40GgClXIMtHa/xYdz48gSMllc9wSd6+2iMdK9UY8vt1nLAdMg6rsvlsHgEDS8YDmGHFBBRP+TX781/5GOzF9WM+TD2mLfaNmHSb2sEuUhYv7TrXXLmcacHZg6prB+7Tn7AAXWmmASqWUBMcGbEDX6AZUJ5AprFu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705774308; c=relaxed/simple;
	bh=UDQxnF9gAi7edn/iXdQ7N5cXzaU1zwgdYP9H4YGRPh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/5l5V2QXGwHP2A0VJdBjThORtlAhgBfwAWte21tTK46AjWxFkfu8Pa8w0ufcgrq6pbtrJdVnPqt25ZgyugBQxPJm0aVTfmrwGNBKlXXK55+TkXJ1TdCnDgbdydihE5mGYulGhpTaR5HIsYGv3N+Baeo7KSJbgZusqiEqQq0cJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alu.unizg.hr; spf=pass smtp.mailfrom=alu.unizg.hr; dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b=kOqNv5Q2; dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b=m056Idew; arc=none smtp.client-ip=161.53.235.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alu.unizg.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alu.unizg.hr
Received: from localhost (localhost [127.0.0.1])
	by domac.alu.hr (Postfix) with ESMTP id C814560187;
	Sat, 20 Jan 2024 19:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1705774294; bh=UDQxnF9gAi7edn/iXdQ7N5cXzaU1zwgdYP9H4YGRPh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kOqNv5Q2tnVcEvdEA1llLWEQyOW+RiJ0/Jazg/J25xEGGtaBb36OdiW9OxoJYrj+0
	 Ey/v0FrgKqqwqejd6a0BCiQboVocxhLa5N01gujUPtom9uWmntUUB12g+LLMGqIlj7
	 oaTVwH0xYBJW4MFmvKxdOHbJauGRdO6bYlrmRH0oe/f6oiSh1OnMmjYNjfp839NX8+
	 xEGT8BJHatQFe2/rDVuiHD8XWm8mLdDSSf95xq1zzoGApYeZ2aAJ7dDc3Zmn0ZG8kN
	 lwGS4P4Q4RfXSLYyUyHwFQNxenM4DjfdmDMDnn/bXhrWAcFG636jo3EUvo5uDFSqxJ
	 e7H9r8Dbl+n/Q==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
	by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEm2dFtW1FYK; Sat, 20 Jan 2024 19:11:32 +0100 (CET)
Received: from [192.168.178.20] (dh207-42-16.xnet.hr [88.207.42.16])
	by domac.alu.hr (Postfix) with ESMTPSA id C0BB660182;
	Sat, 20 Jan 2024 19:11:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1705774292; bh=UDQxnF9gAi7edn/iXdQ7N5cXzaU1zwgdYP9H4YGRPh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m056IdewvB9Cjed+b3KvzLs3+YQbhqvjtMP0fzmX63v9RP7qj4HC4K7XS7mvuP34/
	 1rbEk0n2Plf3QxW5dwDou1U5OavsMMBuBcGu4zQDBJ9GeYiEv/B3DMkPSKyxS51rhF
	 VwSeHC4zRb0CjrEqkblns9n1A8H4ohGstMxcYsBloDhiDzwmMK6ltlHCncwPW2Z/tE
	 bX4ggz5wYsMU7+1hjGGakqX2WEB/ayNzlYijcEoKf4ehm6yyiG/GGrfAbFpY5lg+LB
	 d84JEoYj8RiYroETBpP6vGF/SuoyJ8e4kwjjaWnrduxLNTKSealFW57B7/fe1N593y
	 GFvgb9PTmC9cg==
Message-ID: <bd7b7158-2c38-4d90-acfb-dd5437a0710f@alu.unizg.hr>
Date: Sat, 20 Jan 2024 19:11:27 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION: no console on current -git
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>,
 LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: avier Martinez Canillas <javierm@redhat.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <05ea3233-20dd-4af7-86cc-de11ad2efe84@kernel.dk>
 <0293b14b-6188-4229-9fb6-29fbbdb8dc83@gmx.de>
 <9e09464a-d58c-4f17-9318-26f0813a3023@kernel.dk>
 <b6350dac-0be6-45f9-9309-d196ea455dea@gmx.de>
 <017a1df5-e08b-44c5-9e4e-f61a9ce49e8d@kernel.dk>
 <2c267aef-f1a7-4277-aac6-75d9ea22ec03@gmx.de>
 <93ffd2ee-fa83-4469-96fb-fb263c26bb3c@kernel.dk>
From: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <93ffd2ee-fa83-4469-96fb-fb263c26bb3c@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/24 01:32, Jens Axboe wrote:
> On 1/19/24 5:27 PM, Helge Deller wrote:
>> On 1/19/24 22:22, Jens Axboe wrote:
>>> On 1/19/24 2:14 PM, Helge Deller wrote:
>>>> On 1/19/24 22:01, Jens Axboe wrote:
>>>>> On 1/19/24 1:55 PM, Helge Deller wrote:
>>>>>> Adding Mirsad Todorovac (who reported a similar issue).
>>>>>>
>>>>>> On 1/19/24 19:39, Jens Axboe wrote:
>>>>>>> My trusty R7525 test box is failing to show a console, or in fact anything,
>>>>>>> on current -git. There's no output after:
>>>>>>>
>>>>>>> Loading Linux 6.7.0+ ...
>>>>>>> Loading initial ramdisk ...
>>>>>>>
>>>>>>> and I don't get a console up. I went through the bisection pain and
>>>>>>> found this was the culprit:
>>>>>>>
>>>>>>> commit df67699c9cb0ceb70f6cc60630ca938c06773eda
>>>>>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> Date:   Wed Jan 3 11:15:11 2024 +0100
>>>>>>>
>>>>>>>         firmware/sysfb: Clear screen_info state after consuming it
>>>>>>>
>>>>>>> Reverting this commit, and everything is fine. Looking at dmesg with a
>>>>>>> buggy kernel, I get no frame or fb messages. On a good kernel, it looks
>>>>>>> ilke this:
>>>>>>>
>>>>>>> [    1.416486] efifb: probing for efifb
>>>>>>> [    1.416602] efifb: framebuffer at 0xde000000, using 3072k, total 3072k
>>>>>>> [    1.416605] efifb: mode is 1024x768x32, linelength=4096, pages=1
>>>>>>> [    1.416607] efifb: scrolling: redraw
>>>>>>> [    1.416608] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
>>>>>>> [    1.449746] fb0: EFI VGA frame buffer device
>>>>>>>
>>>>>>> Happy to test a fix, or barring that, can someone just revert this
>>>>>>> commit please?
>>>>>>
>>>>>> I've temporarily added a revert patch into the fbdev for-next tree for now,
>>>>>> so people should not face the issue in the for-next series:
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?h=for-next
>>>>>> I'd like to wait for Thomas to return on monday to check the issue
>>>>>> as there are some other upcoming patches in this area from him.
>>>>>
>>>>> Given the issue (and that I'm not the only one reporting it), can we
>>>>> please just get that pushed so it'll make -rc1? It can always get
>>>>> re-introduced in a fixed fashion. I don't run -next here, I rely on
>>>>> mainline working for my testing.
>>>>
>>>> I agree, it would be good to get it fixed for -rc1.
>>>> So, it's ok for me, but I won't be able to test the revert short time right now.
>>>> If you can assure that the revert fixes it, and builds in git-head,
>>>> I can now prepare the pull request for Linus now (or he just reverts
>>>> commit df67699c9cb0 manually).
>>>
>>> I already tested a revert on top of the current tree, and it builds just
>>> fine and boots with a working console. So reverting it does work and
>>> solves the issue.
>>
>> I sent a pull request with the revert.
> 
> Thanks! You forgot the Reported-by, but no big deal.

Hi,

I confirm that this revert df67699c9cb0ce also solved the original initrd boot problem
here:

  1991  git checkout d97a78423c33
  1992  git revert df67699c9cb0ce
  1993  make clean; make olddefconfig
  1994  time nice make -j 36 bindeb-pkg |& tee ../err-6.8-mrg-1.log; date
  1995  sudo apt-get -s install ../linux-image-6.7.0-bagas-vanilla-rvt-09751-g6b082430adc8_6.7.0-09751-g6b082430adc8-26_amd64.deb
  1996  sudo apt-get -y install ../linux-image-6.7.0-bagas-vanilla-rvt-09751-g6b082430adc8_6.7.0-09751-g6b082430adc8-26_amd64.deb

You might add:

	Tested-by: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>

at your convenience.

Best regards,
Mirsad

