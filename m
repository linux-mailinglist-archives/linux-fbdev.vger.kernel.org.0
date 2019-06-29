Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 385A85AAA1
	for <lists+linux-fbdev@lfdr.de>; Sat, 29 Jun 2019 13:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfF2L7l (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 29 Jun 2019 07:59:41 -0400
Received: from mail-lj1-f174.google.com ([209.85.208.174]:46752 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfF2L7l (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 29 Jun 2019 07:59:41 -0400
Received: by mail-lj1-f174.google.com with SMTP id v24so8498070ljg.13
        for <linux-fbdev@vger.kernel.org>; Sat, 29 Jun 2019 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=7pg/G5kTyACxVzQkku1LK3Egq7+gbscOe8gFTr8DhVs=;
        b=vQmOJHaoxKsQzZUZcWo3YL0DFP7gUQgO6aIYKkFeEA+7NHsltraPTpWa4WOQv9eZzR
         5XYd+Gax1Cv5BBdXbKp0xRFrHVhtN/qRM4vfHqEroeKJxtMrSzu/DUJRsOC/E9MFLGbH
         2bJke+LfbHeH+ytFTn4E0nVYXsa5jELvmtdOxPfikW8w4Yv+/IpK7GUo9ox//vufNxyW
         RPey/NZUsyfCeCgyRAvERgBhfs8pefUVi+vKcOhLp5XOTEbhOLqjere4aIMPwVDNAbBK
         kk7JPC98XxQ0pjq2cgH1wbpDaa8zrnH+7jzgKGOKwtBRIZ1A81aWA6M1PPnx0lSnc8nN
         q19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=7pg/G5kTyACxVzQkku1LK3Egq7+gbscOe8gFTr8DhVs=;
        b=iDje4j/IssfQPGlu3ISbNYudiHLRlT+/hmBmALyEwHPLgxOKBMRydxu4aRAkF1XLmv
         IE7gyYt3y7swM503jawWApcLRHZyTfcfzSCnx0eV1LHa55y+HbK1hU0vDXjOZM22XrH/
         51UFBkWpqiVLyAgWCKgYHvFxW99dXiFgjDvfd9i1B+D/XZlzQs5M7Ll9iNtn2i9rqF3u
         n9p1A7oynHed4kiwwS5OuS1evEPff3wM08ABNn57dsKqONn2eajERwfdt1c35SA/OfqJ
         mAmoLjX78uUGLx2BAkDs7Xpmryc9PBb/O8f6rbvzBwubfFOi8qo4WIhyJmGPdyp7wDrk
         1k/w==
X-Gm-Message-State: APjAAAWBKGmyXvJ7S0AScH/gd3ACPplSasahXE8PNk4OIdjhrYpeK1rF
        B0GdYYbchDM/cKqnZvODLVGPMk6WFOAPaviTMdQ4+ucjmFc=
X-Google-Smtp-Source: APXvYqw+UdlQZOaW+FlY/FxMlxuklSdM0a1WaSC1NfsZuvJiLekPqsRnE85ozyL18n3UeEFu0pRuclroK+g6V2RzR7w=
X-Received: by 2002:a2e:8602:: with SMTP id a2mr8500154lji.206.1561809578694;
 Sat, 29 Jun 2019 04:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+NZatLi=KdC+BnNz8egzDinGv+g9zYMPfn2yyKkFC40fnP5qQ@mail.gmail.com>
In-Reply-To: <CA+NZatLi=KdC+BnNz8egzDinGv+g9zYMPfn2yyKkFC40fnP5qQ@mail.gmail.com>
From:   =?UTF-8?Q?Ricardo_B=C3=A1nffy?= <rbanffy@gmail.com>
Date:   Sat, 29 Jun 2019 12:59:27 +0100
Message-ID: <CA+NZat+HpxvY198+8anEO=8mrrKH-9jJ3RdzG-QGKy76rHqUKg@mail.gmail.com>
Subject: Re: Character attributes in fb console
To:     linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Is this the right list for this kind of question? Is there a list for
questions and developer onboarding?


On Mon, Jun 24, 2019 at 3:33 PM Ricardo B=C3=A1nffy <rbanffy@gmail.com> wro=
te:
>
> Hi foilks,
>
> I'm starting to look into the fb console code and I have a couple questio=
ns:
>
> - Is this the right list to ask questions about architecture and features=
?
> - Do we have a roadmap of things we want to add/remove/refactor?
> - Is there a comprehensive set of documents about the API,
> architecture and expected behavior?
>
> I guess I am looking for a developer getting started path.
>
> Cheers,
>
> Ricardo
>
> --
> Ricardo B=C3=A1nffy
> http://about.me/rbanffy



--=20
Ricardo B=C3=A1nffy
http://about.me/rbanffy
