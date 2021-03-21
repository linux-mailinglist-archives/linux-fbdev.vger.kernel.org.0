Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577B534335B
	for <lists+linux-fbdev@lfdr.de>; Sun, 21 Mar 2021 17:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhCUQPn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 21 Mar 2021 12:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCUQP0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 21 Mar 2021 12:15:26 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80088C061574
        for <linux-fbdev@vger.kernel.org>; Sun, 21 Mar 2021 09:15:26 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id x2so10539151oiv.2
        for <linux-fbdev@vger.kernel.org>; Sun, 21 Mar 2021 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=0nsLYKwr4r2qUI3Xh7fsE1xIH7jaejYzcHTxLEX5ou8=;
        b=lnCd3c5acQOpqWGUkdjO28DTURpCIpw863RHt7pna/GukOUb8ndiNh+CwSicXVbmXt
         x29UtzeVQecEIwa3siHB5lPPsJNAxbjTm9l8TffQhyYEuk6K1NR8uZSLFH0/nNB5DgjC
         poBVEsjML7IgqrnSwJIK+tDheIejaLaO6yXOZxctjfX/Af4WCepFNvkd09196paqNrq7
         JtDJqUYeLaMI8DD3ax0vnk0zx1NibHh2W3UlsQcC2eSvYvb0lrVdEKOT9DrSNkI6pkLK
         Cq+xoc+XgxF+VkCbc0iLJiQkN+oxT70EaTxo6Hg7l1swjVpWNIQXpCmSUaJzpaIwF/+5
         a53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=0nsLYKwr4r2qUI3Xh7fsE1xIH7jaejYzcHTxLEX5ou8=;
        b=DWsEI5yuuvDwIZ0GG5e7c5YEo5NtuoJnZBQqR9y1QSg23GWQbmDPfeME2oX1mOX+4n
         JoSqpjpN7PTSHibk8nvcGiUHDXsVbR6W6adrlJChiXj0bIA8BecIbDd5CjZJz6+dVu9j
         ssEcFT6UaZ3JgmxUg7CdHGp8bWb+jzBA6gl8ZB1c8EeKH3aIdWjm573bD9rryLfh32pu
         Qg1oWnfo3bM5VZItG13NGz4wWJ6KMsVhl4cWjbjJJTVX1WZIsECDtWGZcRLEyQtJl2yW
         ufb+1RYsYXVBFIbCx5wHZT/boBpdQlGQ+LyYMwHF6NkC4hqrhnfhBY+DdwufQhpJtGfx
         DxJw==
X-Gm-Message-State: AOAM530wu6TgbR/cjSK1JdbSqkE0gOlRMSH5iC/toVJxLBzsdGvTl88w
        uWPg8viUp9RIh8T2LsyLTat8cnx0Z8WSuDFPfeY=
X-Google-Smtp-Source: ABdhPJy2XKqL2ljapd9QCQchhTo67HwE8ZWyxWxyV3Yj7tzBA9uH5YbGyIlVjyI1d3a6aVVwoSvjSwqEfa0jJCx+Pro=
X-Received: by 2002:aca:b954:: with SMTP id j81mr4291564oif.45.1616343325743;
 Sun, 21 Mar 2021 09:15:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:dc3:0:0:0:0:0 with HTTP; Sun, 21 Mar 2021 09:15:24 -0700 (PDT)
In-Reply-To: <CAOd5gaOt6ECbAfSxqXhUb6jmGpR8_RKSv09g0gNpvZpEc4zyvw@mail.gmail.com>
References: <CAOd5gaOt6ECbAfSxqXhUb6jmGpR8_RKSv09g0gNpvZpEc4zyvw@mail.gmail.com>
From:   willson mutanda <tyeuis84921@gmail.com>
Date:   Sun, 21 Mar 2021 09:15:24 -0700
Message-ID: <CAOd5gaMcra-nhahY8TqFK_DCM+dM6JY0+ef8AMB8XLpf0=HFAA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello Dear  Gorman

I am sorry for the inconveniences; my name is Willson J. Mutanda, from
pretoria, a Personal assistance to (Mr. Andrew  Gorman) as I have
earlier explained to you.  Mr. Andrew Gorman,  is Gold and Diamond
mining contractor and a business man here in South Africa who passed
away a few years ago. I am writing to you due to the urgency of the
same matter, all effort to locate his relatives after his sudden death
failed.

Since I could not locate any of his relative until now and the
Investment is about to be moved to the state treasury as unclaimed
bill, Please, I demand your consent to contact the company as his heir
as you have the same last name with him; I want you to stand as his
relative to possess his capital investment valued at (7 Million two
hundred British Pounds) with the Investment company as recorded in the
file before it will be confiscated. The fund has been dormant for long
time waiting for his successor which until now no one has showed up
and I cannot find his direct relative.

I got your contact on the internet and decided to contact you as you
have the same name as my master. And I hope you will not expose me
even if you don=E2=80=99t want to help. This deal should be a secret betwee=
n
me and you even after archiving this aim.

 I can guarantee that this case will be executed under a legitimate
arrangement that will protect you and me from any breach of law if we
can put heads together to discuss on what to do about it.  All I
require from you is your honest cooperation to enable us to see this
transaction through; I hope to hear from you immediately after you
read this message for more details.

Kindly, contact my private email below for security reasons if you are
willing to contact the institution regarding this urgent matter. I
learnt your language is not English; please respond to me with English
if you can write with English
 Thanks in advance and God bless you,
Willson J. Mutanda
Email:   willsonmutanda.j@gmail.com
