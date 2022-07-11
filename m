Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E528563B09
	for <lists+linux-fbdev@lfdr.de>; Fri,  1 Jul 2022 22:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiGAUZ7 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 1 Jul 2022 16:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiGAUZ7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 1 Jul 2022 16:25:59 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649364F1A9
        for <linux-fbdev@vger.kernel.org>; Fri,  1 Jul 2022 13:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656707152;
        bh=oA6y+SK8FlTxLms9vHVELuWXS3dG5C4vOJ9qnM6h38g=;
        h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
        b=ZK43zNdj0nxSkJtRc9DcRs3tAQCt8LwDdq+jHrO1PbBG6vd1sodBVI7bft/w/1g4E
         ATL6IY797lmZ/d+5966DLBwJO9E9sQHTOXb5R3dwC5hkfuymwsDk/3kNDQ2sQMT2UQ
         KYPViLOdy0Kg/rbkHnrE10mXBLtjPEe5CVT8r414=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.182.192]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6UZv-1o0TSD0Lmb-0070hx; Fri, 01
 Jul 2022 22:25:52 +0200
Message-ID: <593bd3f3-901d-3374-30ff-b1c5d24d5af9@gmx.de>
Date:   Fri, 1 Jul 2022 22:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] fbcon: Fixes for screen resolution changes - round
 2
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
        daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org
References: <20220701202352.559808-1-deller@gmx.de>
In-Reply-To: <20220701202352.559808-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:96LBxG8R0vUB2OY7vEtbOQZBxj7XsI1EK4QdOk8sOb3dpbJcnlJ
 RqkGdNBnFDPnyR4t49rhSAZkFGXxpcxqqx3hx16zY510EOJGflEuefqWS7uf5PmDWkhhdGs
 Cw17AyAy8EhfI2H0/rO3w8nRl3XnJNjhoxFZHe8qFBI1bbb6uP/cZ6Pq2U77XLLVIoq6Yew
 MPvjE2mzoizqIR3i+jsrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G/nhvvvuFqs=:4yvNC7RnY4NTGDr/uiTCJL
 QHyq/EwO3Xx4QKdlB2QbRi6zh4lq+bpLeOvA0vFQe2hUvhQ+SNioUoVSfrt2e7POwU5lLHZvP
 4SE+5vRZZllBkSyrXzfxV+gyL8pyTP6+9YKZjJtl3aRek94+pQEBMNDJn3ukYSJK9mvTu2HFU
 HBXC5RybuLTaZUGO2zTuyygUUJb+s8l6OCqFWzhA55LwTFNUrNTjnCOGfCX46dHOEBfffbjFL
 HAdE/WLgYSR6+p9MyQRRnQq9vIrBjDZ0rzwu5Wtbu3ZZv8/UG6a6m3klxYPNt0B44Azf6eB5g
 7WqBKuG0d5X+48a6IIshfb/A69i0Ayup6dyiul5aO3p4Yhli+VbwbrryIilU6sD+rE0fL9iMg
 8RbrmRVo6pZ/xon6y6Bs7/ADHNuag11JSFoiBAllCSzjzEmpWwOEedlMTTYaHQ3z3nq8T9HQk
 +RPNQWdOUfAmS3mB51kCltriY6cYvMz0nEDy6QfkPmaVeY8z5T0dLh8pKYiwJe8FbEQRZP7uX
 cpqRPw0ssP3q9OUGgI36IaLEQDlKrFC8QIapz238dyE4q35oApOKdlirwqva98qxHzafyZKYW
 dlTAW2VW09PKcUuSZRPkHrJ9G5in3Ap+TXYXd+bcwUkqNhva/eTF6x0oQrc3un5GG/dwu4BIQ
 a8Y+7zQgkQH3nIHZZu0QboeZwy4bs647rQvj93AiV3oKUMGMt0irehQ4BTM5yv4bSskLdn7Hf
 5msPtQT/c1ai+zmj5RNvhLbZNiHovsMGeKXlAQ6f6vJyiz+gMSbZqHK3Fg/FExCvn1Zu8WGLD
 GSev4DHh1oPW9WVYl5SBeDMD/18dbLg1gUBwvg4Xr1AMM6vE/WuJv/hwdlJU3+7dbsEfGpmA4
 xFscwSzd2V1fIEMvC+2Ss4RXF5hjS4IySCvxLDU6EpsjdHjtCfaaLS1QFShHXmOJI4rjFBxbS
 rAlpTSgPrMdRrc0B29tjoOFDmpfRDI46Rum5dUx8edTipWH8fqEET7ursexrJKDQHhaG2JQdj
 8ui2SHvkJdVzX3SLXtsdQkjjtHJYjadsj9OLJNemixF6YKug26sU5poIdC2eDkEH9wxUvDWdR
 HtvZsSwn9j38pzlD8OSw8RtNk7a3ZP3bOuAfbzyvaBhrMvxryeFQeP5SQ==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

I resent this v2 patch series - this time including patch 4/4.
