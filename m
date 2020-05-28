Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6A71E6CB0
	for <lists+linux-fbdev@lfdr.de>; Thu, 28 May 2020 22:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407311AbgE1Uft (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 28 May 2020 16:35:49 -0400
Received: from mx0b-00256a01.pphosted.com ([67.231.153.242]:2698 "EHLO
        mx0b-00256a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407308AbgE1Ufr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 28 May 2020 16:35:47 -0400
X-Greylist: delayed 3810 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 May 2020 16:35:46 EDT
Received: from pps.filterd (m0144081.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04SJ48td009332
        for <linux-fbdev@vger.kernel.org>; Thu, 28 May 2020 15:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=mime-version : from :
 date : message-id : subject : to : content-type :
 content-transfer-encoding; s=20180315;
 bh=RhDft1+As8V0c8b+X3QEULu8DjaIVtCizVdXGNMDD64=;
 b=F5HeWBOObTxKnNbkuzz8ZnMS/QdWfx84zdou8n07H43Lr/R9AeZDItYnIGBnYTLurUT4
 veY7TOWjIr7EG8Q2Y4roOY72qnOhOyZQjIuoT7TirgnN8BWdf8WlBb2PyZ7/LsVedLgL
 2wPP35pAVXEHfnZQny4FVc0wLwCt5D7NRrTkT8zULzRYxpETQ3pF9Jgvm2odk7F7i+H/
 ohuhab1uIURH3OGqO9yNXJbyzOG0QhFDiLFU2Ye6dPtYZfMAtn4okBHu6LwMprd60wc5
 swMa8CdZde7FbH17xBt9bL9lvUcuE7fbmsqvi7xl6K9AaRMMvMfumqhjKvR10xspwsP6 4A== 
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        by mx0b-00256a01.pphosted.com with ESMTP id 31a20ddcr5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-fbdev@vger.kernel.org>; Thu, 28 May 2020 15:32:14 -0400
Received: by mail-ed1-f72.google.com with SMTP id o12so458260edj.12
        for <linux-fbdev@vger.kernel.org>; Thu, 28 May 2020 12:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=RhDft1+As8V0c8b+X3QEULu8DjaIVtCizVdXGNMDD64=;
        b=OHeVkwlGNT4vhctbIYS6ndth/AGj/T8ctD2JccgJLJaKHAVDyVpzNDpipN0Yx6XSi8
         YD8fwywyWYHda/2mt1+Ik4mi+qOTvvwVGSGzf8c4CO0cVtYzMxLEAwNOmOmty4AgGJt7
         yaEMvbJ22OnrQ8uMp4tKpwyJkRu6KlrXrUiC3E7LL7M6SrqlJVmMmWryP2tQgbXwZ3a7
         lkALdDtqQnsVrsN2JPHaCNzN5PKNSD7bfoY1R6IoWesPdqplziONjR6Lu2/h2laHQaCP
         JZz+H1JM5EKUFsT0c4ika1ilrO/lsybqKgIa28WDawu8eRi6cRIerW5QCHkQZ//Jl05d
         B6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=RhDft1+As8V0c8b+X3QEULu8DjaIVtCizVdXGNMDD64=;
        b=b5Dnh/vHlHUk+fN1YwLEFoPU8iwzo2WGHQf7QKK298YHkV6FrpAG4chGRdIky2xD7b
         P1kZZuE7mlbJ3cqvOk32APYgedoRas7zNjHKLltevANgpad+g1ieJjS4tpVTlt7/bF02
         7RXJqJMjF0ohauGFY26JHXFozfdQxVICssI+maRBSLNpl28GiSrvpDv8RkpYnhXn7wRp
         6fdWoVrIyi8bxE+D+Imsb1XE8I8CFh3mk7NBGteOAAHdx4ykI1PVQxvXe77kD3ihbOV9
         SmYsKIMbipnHQCfIsu4bnlASKE8ePYX+PAJuhlbnqaVVgEs6uIIfs5QmtaRvjLEgmo8T
         mqFQ==
X-Gm-Message-State: AOAM531e269BY3qnEx1o1Fv0/4kj1gj3x5KNwueiXLft2FtZJGDrgFZB
        Ydz/vGwP1znvq3/i36iWHTAQWPOd4m2ARgVryrikD+iRmALfAsVzE3DFnzOGKmnR5aOZpgLgwuw
        0L/XmBsF5Nz8jlXp82BTd+5bOOCE96ISqD++/lA==
X-Received: by 2002:a17:906:ae93:: with SMTP id md19mr4574083ejb.4.1590694332678;
        Thu, 28 May 2020 12:32:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypGJXV/a0Bq9aerOeTDVwSM3QukS2y/oHKaB3Vw7geg+hp2uOiZ0N+OpWMTtzUl4tuiLJ2flmlfEsrNLNIHuE=
X-Received: by 2002:a17:906:ae93:: with SMTP id md19mr4574062ejb.4.1590694332368;
 Thu, 28 May 2020 12:32:12 -0700 (PDT)
MIME-Version: 1.0
From:   Brian D Goldberg <bdg215@nyu.edu>
Date:   Thu, 28 May 2020 15:32:01 -0400
Message-ID: <CAFRjJ8zpbD9iuJ2ofF1abJf_fAuDVDU7OzjDFhLRFpyBiu3dEA@mail.gmail.com>
Subject: modedb and CVT
To:     linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Orig-IP: 209.85.208.72
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 cotscore=-2147483648
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1011
 mlxlogscore=589 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005280127
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello:

I am attempting to get modedb to output a 15kHz Horizontal
320x240@60Hz signal. The standard VESA CEA mode 1,8 represents the
digital implementation of SD resolution re: BT.601
https://en.wikipedia.org/wiki/Rec._601

 Based on this information:

https://www.kernel.org/doc/html/v5.4/fb/modedb.html

It appears that modedb will pass my modeline set in the kernel to some
CVT timing calculator and lets that derive the timings. I have found
that this internal calculator doesn=E2=80=99t work, and using standard CVT
timing selections produces incorrect results in the following manner:

When selecting VESA Mode CEA 8, setting this mode in the kernel works
perfectly, as evidenced by correctly displayed boot screen and initial
pre-cmdline boot dialog. When cmdline parses and modedb sets the
framebuffer, display goes blank.

Modedb reports in /proc/cmdline video=3DHDMI-A-1:720x240M@60 but it does
not output a usable signal.

Since this signal is a standard VESA CEA mode, CVT should create the
mode correctly, but there is clearly something wrong going on with the
timings. Perhaps the CVT calculator is trying to produce a
line-doubled or line-quadrupled mode with 31kHz horizontal?

In any case, it=E2=80=99s not usable in the defined setup. Is this normal? =
Is
there a workaround such as defining a custom video mode for the modedb
pool with custom timings, etc?

I found this old document:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/EDID/HOWTO.txt?id=3Dbe53bfdb8088e9d1924199cc1a96e113756b1075

Which mentions a method to insert a custom EDID, but I don't follow
the method exactly. Is this something that could address the issue I
am having?


Thanks,
Brian Goldberg
