Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D074550B54
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Jun 2022 17:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234697AbiFSPCr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 19 Jun 2022 11:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbiFSPCa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 19 Jun 2022 11:02:30 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6ABDF66
        for <linux-fbdev@vger.kernel.org>; Sun, 19 Jun 2022 08:02:24 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id z9so4554785wmf.3
        for <linux-fbdev@vger.kernel.org>; Sun, 19 Jun 2022 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XfBaW94tYLh6Gfk7V3oY1xEpClLq+agTEi5dSO4kTWE=;
        b=UWATDmDxyWlSoFCcO29rDiTh75DNIcOBzGC9NtUXB/Es3NJh00JfDHcIpk3pXiH46g
         I1NV1V42c+ep2wvTRXqy7ZK0gVzgbetJVED02KJj5ldl1515Jb4laosn8//hc7btMSbJ
         Scn51KfkPO0tt/PXKWPhLM1pcOqKYzb7r+aDBl3PJmIo55xwfuNSve2SGO/m8DVMaxi4
         apgQccBgkm3xj2jL9mP3JlsfBFAd8Id+qHk8zwSuNS0+qWmldoza8vWcPafBZ2WIE3v0
         SjpaKnpVRkBNUWtEo4iMP2Ypbo7HfkH5VXxsm5sbxK6GNm3Itzr3q994RQtHClSTrsOY
         qqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=XfBaW94tYLh6Gfk7V3oY1xEpClLq+agTEi5dSO4kTWE=;
        b=sxwPyAAr4T75e7VuINw8weG5mR5KokuQUxPWcov+3EbAJN55QFLXDMXX79Ir12gaer
         oUqQly2rWcx8K7Xq1sQxms/EEFh4CUWyv9V5qBkpFx+ksTOL2JFjzG3eYT/SVSpYD0Jf
         SBuxHU9jl1OMtrT9k8jKolb4QU8yr3AKXIiNr2FEMcEf7bsaWaGDEk3cW2/MLYrV64KF
         WAx4yrDKDLKMD/tc+aRd0/+ZgC6cxJK3i3zzAVBqRU5KqKsko21nnpclbJy9apse6tRZ
         /8GMKyedeO27fOgOVmK4r4XDOO/bitQj1gxTC+IpvTM0+PgwIEoFCZFXKpvdRFm23d4w
         WH5w==
X-Gm-Message-State: AJIora9wiWSmRSNasDpExiiOSPrblHGdrZGsBHLREdVVFbPiHxEgBcB2
        8imbiTa8EluouZQ1xxa2BNjISfRZXSuCkCrlf+s=
X-Google-Smtp-Source: AGRyM1uCKO4E6U1HyZibZZf/UunedaqaMDDxnXxwxcBNMU46kOOZPWPrLmMyMJFqyiv8cLHxMcO/+ybJnLovbzkTM0E=
X-Received: by 2002:a05:600c:1d9b:b0:39c:7e00:6b7c with SMTP id
 p27-20020a05600c1d9b00b0039c7e006b7cmr20135769wms.50.1655650943515; Sun, 19
 Jun 2022 08:02:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:5c0a:0:0:0:0:0 with HTTP; Sun, 19 Jun 2022 08:02:22
 -0700 (PDT)
Reply-To: wwwheadofficet@gmail.com
From:   "wwwheadofficet@gmail.com" <moneygrambanktransf@gmail.com>
Date:   Sun, 19 Jun 2022 15:02:22 +0000
Message-ID: <CAEDS9iwPiZRpkJxYGMx6skU9n7o2dO+Dsw0pf4tRU12rFWYpqA@mail.gmail.com>
Subject: W
To:     moneygrambanktransf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        NAME_EMAIL_DIFF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

LS0gDQrQv9GA0LjQstC10YINCg0K0JzRiyDRhdC+0YLQtdC70Lgg0LHRiyDRgdC+0L7QsdGJ0LjR
gtGMINCy0LDQvCwg0YfRgtC+INC80Ysg0L/QvtC70YPRh9C40LvQuCDQstCw0Ygg0YTQvtC90LQg
0L7RgiDQnNCS0KQg0LTQu9GPDQrQsdC10LfQvtC/0LDRgdC90L7Qs9C+INC/0LXRgNC10LLQvtC0
0LAg0LLQsNC8LCDQv9C+0YLQvtC80YMg0YfRgtC+INCy0LDRiCDQsNC00YDQtdGBINGN0LvQtdC6
0YLRgNC+0L3QvdC+0Lkg0L/QvtGH0YLRiyDQsdGL0LsNCtC+0LHQvdCw0YDRg9C20LXQvSDQsiDR
gdC/0LjRgdC60LUg0LbQtdGA0YLQsiDQvNC+0YjQtdC90L3QuNGH0LXRgdGC0LLQsC4g0J/QvtC2
0LDQu9GD0LnRgdGC0LAsINC+0YLQstC10YLRjNGC0LUg0LTQu9GPDQrQv9C+0LvRg9GH0LXQvdC4
0Y8g0LHQvtC70LXQtSDQv9C+0LTRgNC+0LHQvdC+0Lkg0LjQvdGE0L7RgNC80LDRhtC40LguDQoN
CtChINC90LXRgtC10YDQv9C10L3QuNC10Lwg0LbQtNC10Lwg0LLQtdGB0YLQtdC5INC+0YIg0LLQ
sNGBINCyINCx0LvQuNC20LDQudGI0LXQtSDQstGA0LXQvNGPDQoNCtChINC70Y7QsdC+0LLRjNGO
Lg0K0KLQvtC90Lgg0JDQu9GM0LHQtdGA0YINCtC00LjRgNC10LrRgtC+0YAg0L7RhNC40YHQsA0K
V2hhdHNBcHAsICsyMjg5MTQ0MTg1Ng0K
